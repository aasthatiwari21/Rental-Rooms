class Ability
  include CanCan::Ability

  def initialize(user)
    if user.seeker?
      can :read, Property 
    elsif user.broker? || user.owner?
      can :manage, Property, user_id: user.id
    end
  end
end