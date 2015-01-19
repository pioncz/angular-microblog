class UserController < ApplicationController
  before_action :is_authenticated

  def profile
  end
end
