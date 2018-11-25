class Types::CreateReportAttributes < Types::BaseInputObject
  description "Attributes for creating a report"
  argument :catch_id, ID, required: true
  argument :name, String, required: true
  argument :phone, String, required: true
  argument :email, String, required: true
  argument :issue, String, required: true
end