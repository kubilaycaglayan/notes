class UsersController < ApplicationController
  def index
    @users = User.all
    #session[:current_user_id] = 2
  end
end
