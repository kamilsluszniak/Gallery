class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:approve]
  
  def index
    if current_user && current_user.admin?
      @users = User.all
    end
  end
  
  def approve
    if current_user && current_user.admin?
      @user.approve!
    end
  end
  
  
  private
    def set_user
      @user = User.find(params[:id])
    end
end
