# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    user ||= User.new # guest user (not logged in)
    if user.superadmin_role?
      can :manage, :all
      can :access, :rails_admin
      can :manage, :dashboard
    end
    if user.doctor_role?
      can :manage, User
    end
    if user.nurse_role?
      can :manage, User
      end
    if user.user_role?
      can :manage, User
    end

  end
end
