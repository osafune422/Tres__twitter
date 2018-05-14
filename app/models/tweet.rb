class Tweet < ApplicationRecord
    # contentのエラー条件
    validates :content, {presence: true, length: {maximum: 140}}
    #user_idのエラー条件
    validates :user_id, {presence: true}
    
    def user
        return User.find_by(id: self.user_id)
    end
    
    def timelines
        @timelines = 0
        @current_user.followings.each do |following|
            following.followed_user.tweets.each do |tweet|
                @timelines << tweet
            end
        end
        return @timelines.all.order(created_at: :desc)
    end
end
