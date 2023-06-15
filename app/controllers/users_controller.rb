# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def search
    if params[:email].present?
      @users = User.where(email: params[:email])
    else
      @users = []
    end
  end
end
