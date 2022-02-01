class UserController < ApplicationController

  # GET /users, returns a list of all users
  def index
    @users = User.all
    render json: @users, status: 200
  end

  # GET /user/:id, returns user object based on ID
  def show
    @user = User.find(params[:id]) rescue { error: 'User not found'}
    render json: @user, status: 200
  end
 
  # POST /user/new, creates new user if provided first_name, last_name, and username
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 200
    else
      render json: { error:  "Validation Failed", user: @user }, status: 400
    end
  end

  # PUT /user/edit/:id, updates user object if found
  def update
    @user = User.find(params[:id])
    # render json: user: @user, status: 200
  end

  # validates pararameters when creating new user
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username)
    end

end