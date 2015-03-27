class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.manufacturer?
      can :read, Record
      can :create, Record
      can :update, Record do |record|
        record.try(:user) == user
      end
      can :destroy, Record do |record|
        record.try(:user) == user
      end
    elsif user.distributor?
      can :read, Record
      can :create, Record
      can :update, Record do |record|
        record.try(:user) == user
      end
      can :destroy, Record do |record|
        record.try(:user) == user
      end
    end
  end
end
