class TweetsController < ApplicationController
  before_action :ensure_correct_user, {only:[:destroy_tweet]}      #ユーザーのidが異なる時
  
  def timeline
    @tweet_count = @current_user.tweets.count
    @following_count = Follow.where(following_id:@current_user.id).count
    @following_count -= 1
    @followed_count = Follow.where(followed_id:@current_user.id).count
    @followed_count -= 1
  end
  
  def show
    @tweet = Tweet.find_by(id: params[:id])
    @user = @tweet.user
    @likes_count = @tweet.likes.count
  end
  
  def new_tweet
    @tweet = Tweet.new
  end
  
  def tweet
    @tweet = Tweet.new(
      user_id: @current_user.id,
      content: params[:content],
      )
    
    if @tweet.save
      flash[:notice] = "ツイートしました"
      redirect_to("/mypage/#{@current_user.id}/#{@current_user.login_id}")
    else
      render("tweets/new_tweet")
    end
  end
  
  def destroy_tweet
    @tweet = Tweet.find_by(id: params[:id])
    @tweet.destroy
    flash[:notice] = "ツイートを削除しました"
    redirect_to("/mypage/#{@current_user.id}/#{@current_user.login_id}")
  end
  
  def ensure_correct_user
    @tweet = Tweet.find_by(id: params[:id])
    if @current_user.id != @tweet.user_id.to_i
      flash[:notice] = "権限がありません"
      redirect_to("/mypage/#{@current_user.id}/#{@current_user.login_id}")
    end
  end
end
