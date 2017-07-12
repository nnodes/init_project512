class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)
    user ||= User.new
    case controller_namespace
    when 'Admin'
      if user.admin?
        can :manage, :all
        cannot :destroy, Page, home_page: false
      end
    else
      if user.id.present? and user.admin?
        can :manage, :all
        cannot :destroy, Page, home_page: false
      elsif user.id.present?
        can :read, :all
      else
        can :read, :all
        # Non logged users
      end
    end
  end
end
