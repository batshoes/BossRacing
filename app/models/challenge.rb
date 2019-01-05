class Challenge < ApplicationRecord
  enum status: {
    pending: 'pending',
    accepted: 'accepted',
    rejected: 'rejected',
    completed: 'completed'
  }
  has_many :users
  belongs_to :event

  validates_presence_of :event_id, :start_time, :challenger_id, :challengee_id

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
