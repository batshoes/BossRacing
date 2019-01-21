class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, authentication_keys: [:login]
  attr_writer :login

  has_many :initiated_challenges, class_name: "Challenge", foreign_key: :challenger_id
  has_many :received_challenges, class_name: "Challenge", foreign_key: :challengee_id

  has_many :wins, through: :initiated_challenges

  enum roles: {
    user: 'user',
    admin: 'admin'
  }

  def challenges
    initiated_challenges + received_challenges
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
