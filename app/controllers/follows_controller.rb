class FollowsController < ApplicationController
    def follow
        @follow = Follow.new(
            following_id: @current_user.id,
            followed_id: params[:user_id]
            )
        @follow.save
        @user=User.find_by(params[:user_id])
        redirect_to("/mypage/#{params[:user_id]}/#{@user.login_id}")
    end
    
    def destroy
        @follow = Follow.find_by(
            following_id: @current_user.id,
            followed_id: params[:user_id]
            )
        @follow.destroy
        @user=User.find_by(params[:user_id])
        redirect_to("/mypage/#{params[:user_id]}/#{@user.login_id}")
    end
    
    
    
    def followed
        @user = User.find_by(id: params[:id])
        @tweet_count = Tweet.where(user_id:@user.id).count
        @following_count = Follow.where(following_id:@user.id).count
        @followed_count = Follow.where(followed_id:@user.id).count
        @like_count = Like.where(userlike_id:@user.id).count
    end
end
