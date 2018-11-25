class Mutations::ReportCreate < Mutations::BaseMutation
  argument :input, Types::CreateReportAttributes, required: true

  field :report, Types::ReportType, null: true
  field :errors, [String], null: false

  def resolve(input:)
    katch = Catch.find_by!(code: input.catch_id)
    report = katch.reports.build(
      name: input.name,
      phone: input.phone,
      email: input.email,
      issue: input.issue)

    if report.save
      {
        report: report,
        errors: [],
      }
    else
      {
        report: nil,
        errors: report.errors.full_messages
      }
    end
  end
end