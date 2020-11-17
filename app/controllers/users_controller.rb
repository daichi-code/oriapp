class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @tweets = @user.tweets
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.all
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.all
  end

  def likes
    @user = Tweet.find(params[:id])
    @users = @user.likes.all
  end

  def liked
    @user = User.find(params[:id])
    @users = Like.where(user_id: @user.id)
  end
end
