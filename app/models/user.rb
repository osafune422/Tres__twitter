class User < ApplicationRecord
    has_secure_password
    
    # nameのエラー条件
    validates :name, {presence: true}
    # login_idのエラー条件
    validates :login_id, {presence: true, uniqueness: true}
    # profileのエラー条件
    validates :profile, {length: {maximum: 140}}
    
    def tweets
        @tweet=Tweet.where(user_id: self.id)
        return @tweet.all.order("created_at DESC")
    end
    
    def followings
        @following = Follow.where(following_id: self.id)
        return @following.all.order("created_at DESC")
    end
    
    def followeds
        @followed = Follow.where(followed_id: self.id)
        return @followed.all.order("created_at DESC")
    end
    
    def likes
        return Like.where(userlike_id: self.id)
    end
end
