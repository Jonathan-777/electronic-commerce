class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_one :user_data, dependent: :destroy
    before_validation :handle_guest_behavior

  
    
    scope :registered_users, -> { where(guest: false) }
    scope :guests, -> { where(guest: true) }
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, unless: -> { self.guest == true }
    validates :guest, inclusion: { in: [ true, false ] }
    validates :password, presence: true, if: -> { guest == false }


    private

    def handle_guest_behavior
        if guest
          # Remove password-related attributes for guests
          self.encrypted_password = nil
          self.email = nil
          self.password = nil
          self.password_confirmation = nil
          @password = nil
          @password_confirmation = nil
          @email = nil
        end
    end

    def email_required?
      !guest?
    end
    def password_required?
      !guest?
    end
    
end
