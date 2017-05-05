class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
  
    # set authorizations for different user roles
    if user.role? :admin
      # they get to do it all
      can :manage, :all
      
    elsif user.role? :manager
      # can read any info in system
      can :read, :all
      
      # they can create, edit, and read employee data
      can [:create, :edit, :update, :read], User do |u|  
        u.role == "shipper" || u.role == "manager"
      end

      # they can create, edit, and read items; can destroy, deactivate items
      can [:create, :edit, :update, :read, :destroy], Item 
      # deactivate

      # they can read full price history; create new prices
      can :create, ItemPrice
      can [:read, :create], ItemPrice

      # they can add purchases
      can :create, Purchase
      
      # they can read info about customers, school, orders
      can :read, School
      can :read, Order
      can :read, User do |u|
        u.role == "customer"
      end

    elsif user.role? :shipper
      # they can read their own profile
      can :show, User do |u|  
        u.id == user.id
      end

      # can edit profile
      can :edit, User do |u|  
        u.id == user.id
      end

      # they can read info on orders that need to be shipped
      can :read, Order.not_shipped
      
      # they can read information on items
      can :read, Item

    elsif user.role? :customer
      # they can read their own profile
      can :show, User do |u|  
        u.id == user.id
      end

      can :edit, User do |u|  
        u.id == user.id
      end

      # they can place new orders, cancel unshipped orders
      can :create, Order 
      can :destroy, Order.not_shipped
      
      # they can read info about items
      can :read, Item

      # they can see a list of their own orders
      can :read, Order do |o|
        o.user.id == user.id
      end

      # they can add schools
      can :read, School #do |s|
        #user_id == user.id
      # end

      can :create, School

    else
      # guests can only read domains covered (plus home pages)
      can :read, Item
      can :create, User
      can :create, School
    end
    
  end
end
