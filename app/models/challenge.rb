class Challenge < ApplicationRecord
  has_many :users
  belongs_to :event

  validates_presence_of :event_id

  def event_name
    event.name
  end

  def challenger
    User.find(self.challenger_id).username
  end

  def challengee
    User.find(self.challengee_id).username
  end
end
