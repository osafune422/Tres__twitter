class Follow < ApplicationRecord
    def followed_user
        return User.find_by(id: self.followed_id)
    end
    
    def following_tweets
        @following = Follow.where(following_id: self.id)
        puts @following
        @tweet=Tweet.where(user_id: @following.followed_id)
        puts @tweet
        return @tweet.all.order("created_at DESC")
    end
    
end
