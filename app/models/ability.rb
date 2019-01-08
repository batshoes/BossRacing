class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    return unless user.present?
    # signed in to read
    can :read, Challenge
    # Only Challenge issuer can destroy/edit details
    can :manage, Challenge, challenger_id: user.id
    # Only  Challenge receiver can update status from pending -> accept/rejected
  can :update, Challenge, challengee_id: user.id
    can :accept_or_reject_challenge, Challenge, challengee_id: user.id, status: 'pending'
    # Either Challenger or Challengee can update status to completed, issuing confirmation email
    can :mark_challenge_complete, Challenge, challengee_id: user.id, status: 'accepted'
    can :mark_challenge_complete, Challenge, challengee_id: user.id, status: 'rejected'
    can :mark_challenge_complete, Challenge, challenger_id: user.id, status: 'accepted'
    can :mark_challenge_complete, Challenge, challenger_id: user.id, status: 'rejected'

    return unless user.admin?
    # Allow admin user full access
    can :manage, :all
  end
end
