# frozen_string_literal: true

module Vapi
  module Types
    # This is the voicemail detection plan for the workflow.
    class CreateWorkflowDtoVoicemailDetection < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::CreateWorkflowDtoVoicemailDetectionZero }
      member -> { Vapi::Types::GoogleVoicemailDetectionPlan }
      member -> { Vapi::Types::OpenAiVoicemailDetectionPlan }
      member -> { Vapi::Types::TwilioVoicemailDetectionPlan }
      member -> { Vapi::Types::VapiVoicemailDetectionPlan }
    end
  end
end
