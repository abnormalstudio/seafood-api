class Fish < ApplicationRecord

  has_many :fisheries
  has_many :catches

end
