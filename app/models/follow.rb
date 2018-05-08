class Follow < ApplicationRecord
    def following_tweets
        @following = Follow.where(following_id: self.id)
        @tweet=Tweet.where(user_id: @following.followed_id)
        return @tweet.all.order("created_at DESC")
    end
end
