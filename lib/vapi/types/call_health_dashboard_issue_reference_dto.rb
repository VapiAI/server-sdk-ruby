# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardIssueReferenceDto < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :status, -> { Vapi::Types::CallHealthDashboardIssueReferenceDtoStatus }, optional: false, nullable: false
      field :row_version, -> { Integer }, optional: false, nullable: false, api_name: "rowVersion"
    end
  end
end
