class Challenge < ApplicationRecord
  enum status: {
    pending: 'pending',
    accepted: 'accepted',
    rejected: 'rejected',
    completed: 'completed'
  }

<<<<<<< HEAD
=======
  belongs_to :challenger, class_name: 'User'
  belongs_to :challengee, class_name: 'User'

  has_many :users
>>>>>>> 9681cf1104b94a532220c8953cf9bb85e9a600b0
  belongs_to :event

  belongs_to :challenger, class_name: 'User'
  belongs_to :challengee, class_name: 'User'

  has_one :result

  validates_presence_of :event_id, :start_time, :challenger_id, :challengee_id

  scope :upcoming, ->(limit, status){ where(status: status).limit(limit) }

  def event_name
    event.name
  end

<<<<<<< HEAD
  def users
    return [challenger, challengee]
  end

=======
  def challenger_name
    challenger.username
  end

  def challengee_name
    challengee.username
  end
>>>>>>> 9681cf1104b94a532220c8953cf9bb85e9a600b0
end
