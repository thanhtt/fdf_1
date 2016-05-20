class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.member?
      can :read, Suggestion
      can :create, Suggestion
      can :update, Suggestion
    elsif user.guest?
      can :read, Suggestion
    end
  end
end
