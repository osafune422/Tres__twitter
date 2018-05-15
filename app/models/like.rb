class Like < ApplicationRecord
    belongs_to :tweet
    
    # userlike_idのエラー条件
    validates :userlike_id, {presence: true}
    # tweet_idのエラー条件
    validates :tweet_id, {presence: true}
    
#    def tweet
#        return Tweet.find_by(id: self.tweet_id)
#    end
    
end
