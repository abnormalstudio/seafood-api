class Catch < ApplicationRecord

  PRESERVATION_METHODS = [
    'fresh',
    'salted',
    'iced'
  ].freeze

  belongs_to :fishery
  belongs_to :fish
  has_many :scans
  has_many :reports

  validates :latitude, :longitude, :caught_on, :code, :location, presence: true

  before_validation :set_code, on: :create

  def self.generate_code
    SecureRandom.hex(10).first(6).upcase
  end

  private

  def set_code
    self.code ||= Catch.generate_code
  end
end
