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
end
