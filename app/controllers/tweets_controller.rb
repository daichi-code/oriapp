class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_tweet, only: [:edit, :show]


  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    binding.pry
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if user_signed_in? && current_user.id == @tweet.user_id
    @tweet.destroy
    redirect_to root_path
    end
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
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end



  private
  def tweet_params
    params.require(:tweet).permit(:text, :season_id, :prefecture_id, :category_id, :image).merge(user_id: current_user.id)
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
