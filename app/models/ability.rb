class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)
    user ||= User.new
    case controller_namespace
    when 'Admin'
      if user.admin?
        can :manage, :all
      end
    else
      if user.id.present?
        # Ability for logged users
      else
        # Non logged users
      end
    end
  end
end
