module Types
  class NutrientType < Types::BaseObject
    field :name, String, "Nutrient name", null: false, hash_key: 'name'
    field :group, String, "Nutrient group", null: false, hash_key: 'group'
    field :unit, String, "Nutrient unit", null: false, hash_key: 'unit'
    field :value, Float, "Nutrient value", null: false, hash_key: 'value'
  end
end