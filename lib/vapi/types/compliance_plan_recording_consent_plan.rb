# frozen_string_literal: true

module Vapi
  module Types
    # Controls how recording consent is requested before the assistant joins the call.
    class CompliancePlanRecordingConsentPlan < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::RecordingConsentPlanStayOnLine }, key: "STAY_ON_LINE"
      member -> { Vapi::Types::RecordingConsentPlanVerbal }, key: "VERBAL"
    end
  end
end
