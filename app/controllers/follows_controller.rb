class FollowsController < ApplicationController
    def follow
        @nowuser=User.find_by(params[:user_id])
        @follow = Follow.new(
            following_id: @current_user.id,
            followed_id: params[:user_id]
            )
        @follow.save
        redirect_to("/mypage/#{params[:user_id]}/#{@nowuser.login_id}")
    end
    
    def destroy
        @nowuser=User.find_by(params[:user_id])
        @follow = Follow.find_by(
            following_id: @current_user.id,
            followed_id: params[:user_id]
            )
        @follow.destroy
        redirect_to("/mypage/#{params[:user_id]}/#{@nowuser.login_id}")
    end
    
    def followed
        @user = User.find_by(id: params[:id])
        @tweet_count = Tweet.where(user_id:@user.id).count
        @following_count = Follow.where(following_id:@user.id).count
        @followed_count = Follow.where(followed_id:@user.id).count
        @like_count = Like.where(userlike_id:@user.id).count
    end
end
