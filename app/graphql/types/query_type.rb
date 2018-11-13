module Types
  class QueryType < Types::BaseObject
    field :catch, Types::CatchType, null: false do
      argument :code, ID, 'Code of catch', required: true
    end

    def catch(code:)
      Catch.find_by!(code: code)
    end
  end
end
