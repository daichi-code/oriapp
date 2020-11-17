class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(tweet_id: params[:tweet_id])
    redirect_back(fallback_location: root_path)

    # @user = current_user
    # @like = Like.find(params[:like_id])
    # current_user.like(@like)
    # #通知機能追加
    # @like.create_notice_like!(current_user)
    # respond_to do |format|
    #   format.html { redirect_back(fallback_location: root_url) }
    #   format.js
    # end
  end

  def destroy
    @like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end
