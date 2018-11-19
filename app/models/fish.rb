class Fish < ApplicationRecord

  has_many :fisheries
  has_many :catches

  validates :species, :mercury_mean_ppm, :mercury_num_samples, presence: true

end
