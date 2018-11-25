class Fishery < ApplicationRecord

  has_many :catches
  has_one :user

  validates :name, :address, :contact, :phone, :email, :website, presence: true

end
