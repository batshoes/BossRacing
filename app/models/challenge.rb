class Challenge < ApplicationRecord
  has_many :users

  def challenger
    User.find(self.challenger_id).username
  end
  def challengee
    User.find(self.challengee_id).username
  end
end
