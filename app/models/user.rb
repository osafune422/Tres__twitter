class User < ApplicationRecord
    has_secure_password
    
    # nameのエラー条件
    validates :name, {presence: true}
    # login_idのエラー条件
    validates :login_id, {presence: true, uniqueness: true}
    
    def tweets
        @tweet=Tweet.where(user_id: self.id)
        return @tweet.all.order("created_at DESC")
    end
    
    def self_tweets
        @tweet=Tweet.where(user_id: self.id) 
        return @tweet.all.order("created_at DESC")
    end

end
