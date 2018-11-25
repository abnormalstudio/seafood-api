module Types
  class MutationType < Types::BaseObject
    field :report_create, mutation: Mutations::ReportCreate
  end
end
