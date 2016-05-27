class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.member?
      can :read, [Suggestion, Order]
      can :create, [Suggestion, Order]
      can :update, [Suggestion, Order]
    elsif user.guest?
      can :read, Suggestion
    end
  end
end
