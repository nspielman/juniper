class UsersController < ApplicationController
  before_action :signed_in_user
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      username = params[:username] || params[:id]
      @user = User.find_by_username(username)
    end

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :password, :password_confirmation)
    end
end
