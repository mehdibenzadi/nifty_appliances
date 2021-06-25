class Appliance < ApplicationRecord
  belongs_to :user, optional: true 
  has_many :permissions
end
