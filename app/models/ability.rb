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
      can :access, Patient
      can :manage, Prescription
      can :read, Dosage
    end
    if user.nurse_role?
      can :manage, Dosage
      can :access, Patient
      can :read, Prescription


      end
    if user.user_role?
      can :read, Patient
      can :access, Prescription
      can :read, Dosage
    end

  end
end
