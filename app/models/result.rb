class Result < ApplicationRecord
  belongs_to :challenge
  belongs_to :victor, class_name: 'User'
  belongs_to :defeated, class_name: 'User'

end
