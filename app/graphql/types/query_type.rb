module Types
  class QueryType < Types::BaseObject
    field :catch, Types::CatchType, null: false do
      argument :id, ID, 'ID of catch', required: true
    end

    def catch(id:)
      Catch.find_by!(code: id)
    end
  end
end
