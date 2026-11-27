# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardTriageRequestDto < Internal::Types::Model
      field :action, -> { Vapi::Types::CallHealthDashboardTriageRequestDtoAction }, optional: false, nullable: false
      field :expected_row_version, -> { Integer }, optional: false, nullable: false, api_name: "expectedRowVersion"
      field :comment, -> { String }, optional: true, nullable: false
    end
  end
end
