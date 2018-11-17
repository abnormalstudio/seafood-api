module Types
  class FisheryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :address, String, null: false
    field :contact, String, null: false
    field :phone, String, null: false
    field :email, String, null: false
    field :website, String, null: false
  end
end