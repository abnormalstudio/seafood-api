module Types
  class CatchType < Types::BaseObject
    field :code, String, null: false
    field :latitude, Float, null: false
    field :longitude, Float, null: false
    field :caughtOn, String, null: false
    field :fish, Types::FishType, null: false
  end
end
