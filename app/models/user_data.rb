class UserData < ApplicationRecord
  belongs_to :user

  attr_accessor :ready_for_data_entry
  def initialize(attributes = nil)
    super
    self.ready_for_data_entry = false
  end

  with_options if: -> { ready_for_data_entry } do
   validates :phone_number, presence: true
   validates :date_of_birth, presence: true
   validates :address, presence: true
   validates :recovery_email, presence: true, uniqueness: true, unless: -> { user&.guest == true }
  end

end
