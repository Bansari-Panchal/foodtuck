class UsersController < ApplicationController

  before_action :authenticate_user!
  def index
    if params[:search]
      @vendors = Vendor.search(params[:search]).order("created_at DESC")
    else
      @vendors = Vendor.all.order('created_at DESC')
    end
  end
          
    def show
      @user = User.find(params[:id])
    end
          
    def new
      @user = User.new
    end
          
    def edit
      @user = User.find(params[:id])
    end
          
    def create
      @user = User.new(user_params)
          
      if @user.save
        redirect_to @user
      else
        render 'new'
      end
    end
          
    def update
      @user = User.find(params[:id])
          
      if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    end
          
    def destroy
      @user = User.find(params[:id])
      @user.destroy
             
      redirect_to users_path
    end
          
    private
    def user_params
      params.require(:user).permit(:email, :password ,:name,:phone ,:password_confirmation,:login,:birthdate,:timezone,:image)
    end
          
end