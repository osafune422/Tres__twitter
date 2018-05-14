class Follow < ApplicationRecord
    def followed_user
        return User.find_by(id: self.followed_id)
    end
    
    def following_user
        return User.find_by(id: self.following_id)
    end
    
end
