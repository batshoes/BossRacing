class Challenge < ApplicationRecord
  enum status: {
    pending: 'pending',
    accepted: 'accepted',
    rejected: 'rejected',
    completed: 'completed'
  }

  belongs_to :challenger, class_name: 'User'
  belongs_to :challengee, class_name: 'User'

  has_many :users
  belongs_to :event

  validates_presence_of :event_id, :start_time, :challenger_id, :challengee_id

  def event_name
    event.name
  end

  def challenger_name
    challenger.username
  end

  def challengee_name
    challengee.username
  end
end
