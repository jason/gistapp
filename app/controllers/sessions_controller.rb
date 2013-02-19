class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_name(params[:user][:name])

    if @user
      build_cookie(@user)
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  def destroy
    destroy_cookie
    redirect_to root_path
  end
end
