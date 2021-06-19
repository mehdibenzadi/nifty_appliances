class User < ApplicationRecord
  has_many :appliances
  has_many :permissions
  has_many :permitted_appliances, class_name: "Appliance", through: :permissions, source: :appliance
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
