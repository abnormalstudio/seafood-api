class Scan < ApplicationRecord

  belongs_to :catch

  validates :scanner, :latitude, :longitude, :scanned_at, presence: true

end
