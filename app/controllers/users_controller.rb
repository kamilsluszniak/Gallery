class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:approve, :show, :edit, :update]
  
  def index
    if current_user && current_user.admin?
      @users = User.where("confirmed_at IS NOT NULL")
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @user.id == current_user.id
      if @user.save
        flash[:success] = "Profile updated"
      else
        flash[:danger] = "Not updated"
      end
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
    
    def user_params
      params.require(:user).permit(:name, :email, :avatar)
    end
end
