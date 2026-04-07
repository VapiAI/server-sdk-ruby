# frozen_string_literal: true

module Vapi
  module Types
    class VapiVoicemailDetectionPlan < Internal::Types::Model
      field :beep_max_await_seconds, -> { Integer }, optional: true, nullable: false, api_name: "beepMaxAwaitSeconds"
      field :provider, -> { Vapi::Types::VapiVoicemailDetectionPlanProvider }, optional: false, nullable: false
      field :backoff_plan, -> { Vapi::Types::VoicemailDetectionBackoffPlan }, optional: true, nullable: false, api_name: "backoffPlan"
      field :type, -> { Vapi::Types::VapiVoicemailDetectionPlanType }, optional: true, nullable: false
    end
  end
end
