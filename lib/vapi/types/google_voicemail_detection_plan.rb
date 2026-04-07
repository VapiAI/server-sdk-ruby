# frozen_string_literal: true

module Vapi
  module Types
    class GoogleVoicemailDetectionPlan < Internal::Types::Model
      field :beep_max_await_seconds, -> { Integer }, optional: true, nullable: false, api_name: "beepMaxAwaitSeconds"
      field :provider, -> { Vapi::Types::GoogleVoicemailDetectionPlanProvider }, optional: false, nullable: false
      field :backoff_plan, -> { Vapi::Types::VoicemailDetectionBackoffPlan }, optional: true, nullable: false, api_name: "backoffPlan"
      field :type, -> { Vapi::Types::GoogleVoicemailDetectionPlanType }, optional: true, nullable: false
    end
  end
end
