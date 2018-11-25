module Types
  class CatchType < Types::BaseObject
    field :id, String, null: false, method: :code
    field :latitude, Float, null: false
    field :longitude, Float, null: false
    field :location, String, null: false
    field :caughtOn, String, null: false

    field :vessel, String, null: false
    def vessel
      object.vessel.presence || 'Unknown'
    end

    field :preservation_method, String, null: false
    def preservation_method
      (object.preservation_method.presence || 'unknown').titleize
    end

    field :fish, FishType, null: false
    field :fishery, FisheryType, null: false
    field :scans, ScanType.connection_type, null: false
  end
end
