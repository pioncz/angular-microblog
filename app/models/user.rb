require 'digest/sha1'

class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :active_relationships, class_name: "Relationship",
	                              foreign_key: "follower_id",
	                              dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship",
	                              foreign_key: "followed_id",
	                              dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :follower

	attr_accessor :new_password
	validates_confirmation_of :new_password
	validates_presence_of :new_password, :on => :create
	validates_presence_of :email
	validates_presence_of :login
	validates_uniqueness_of :email
	validates_uniqueness_of :login

	before_save :hash_new_password, :if=>:password_changed?

	def password_changed?
		!@new_password.blank?
	end

	def follow(other_user)
		active_relationships.create(followed_id: other_user.id)
	end

	def unfollow(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	end

	def following?(other_user)
		following.include?(other_user)
	end

	private

	def hash_new_password
    self.password =  Digest::SHA1.hexdigest(new_password)
	end

	def self.authenticate(login, new_password)
		user = find_by_email(login)
		if user && user.password == Digest::SHA1.hexdigest(new_password)
			user
		else
			nil
		end
	end
end
