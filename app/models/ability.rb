class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, User, id: user.id
    can :manage, Group, user: user
    can :manage, Expense, user:
  end
end
