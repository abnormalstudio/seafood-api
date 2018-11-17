module Types
  class CatchType < Types::BaseObject
    field :id, String, null: false, method: :code
    field :latitude, Float, null: false
    field :longitude, Float, null: false
    field :caughtOn, String, null: false
    field :fish, FishType, null: false
    field :fishery, FisheryType, null: false
    field :scans, ScanType.connection_type, null: false
  end
end
