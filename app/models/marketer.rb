class Marketer
  include CanCan::Ability

  def initialize user
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('Marketer')
      can [:admin, :index, :show], Spree::Order
    end
  end
end
