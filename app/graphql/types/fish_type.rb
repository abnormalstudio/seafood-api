module Types
  class FishType < Types::BaseObject
    field :species, String, null: false
    field :mercuryMeanPpm, Float, null: false
    field :mercuryNumSamples, Integer, null: false
  end
end
