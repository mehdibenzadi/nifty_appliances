class Appliance < ApplicationRecord
  belongs_to :user, optional: true 
end
