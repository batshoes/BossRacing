class UserChallenge < ApplicationRecord
  belongs_to :challenger, class_name: "User"
  belongs_to :challengee, class_name: "User"
  belongs_to :challenge
end
