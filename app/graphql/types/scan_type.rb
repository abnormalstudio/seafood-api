module Types
  class ScanType < Types::BaseObject
    field :id, ID, null: false
    field :latitude, Float, null: false
    field :longitude, Float, null: false
    field :scanned_at, String, null: false
    field :scanner, String, null: false
    field :catch, CatchType, null: false
  end
end
