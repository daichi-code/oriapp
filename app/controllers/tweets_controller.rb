class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_tweet, only: [:edit, :show]


  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.valid?
      @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    # if user_signed_in? && current_user.id == @.user_id
    @tweet.destroy
    redirect_to root_path
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    if @tweet.valid?
      @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :image, :season_id, :prefecture_id, :category_id).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
