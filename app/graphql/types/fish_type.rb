module Types
  class FishType < Types::BaseObject
    field :id, ID, null: false
    field :species, String, null: false
    field :mercuryMeanPpm, Float, null: false
    field :mercuryNumSamples, Integer, null: false
    field :nutrients, NutrientType.connection_type, null: false
  end
end
