class Fishery < ApplicationRecord

  has_many :catches

  validates :name, :address, :contact, :phone, :email, :website, presence: true

end
