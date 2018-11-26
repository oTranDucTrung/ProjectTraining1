class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :get_user

  def show
    @count_review = @user.courses.map(&:comments).flatten.size
    @courses = @user.courses.page(params[:page]).per(Settings.course.item)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def following
    @title = t "users.show_follow.following"
    @users = @user.following.page params[:page]
    render :show_follow
  end
  
  def followers
    @title = t "users.show_follow.followers"
    @users = @user.followers.page params[:page]
    render :show_follow
  end

  private

  def get_user
    redirect_to root_path unless @user = User.find_by(id: params[:id])
  end
end
