class Challenge < ApplicationRecord
  has_many :users
  
  EVENT_TYPES = ["500m Row", "5km Row", "Best of 5 minutes", "Best of 10 minutes"]
  def challenger
    User.find(self.challenger_id).username
  end

  def challengee
    User.find(self.challengee_id).username
  end
end
