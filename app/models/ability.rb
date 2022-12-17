class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Group, user_id: user.id
    can :destroy, Group, user_id: user.id
    can :create, :all
  end
end
