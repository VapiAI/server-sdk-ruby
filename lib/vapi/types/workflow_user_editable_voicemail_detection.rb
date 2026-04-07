# frozen_string_literal: true

module Vapi
  module Types
    # This is the voicemail detection plan for the workflow.
    class WorkflowUserEditableVoicemailDetection < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::WorkflowUserEditableVoicemailDetectionZero }
      member -> { Vapi::Types::GoogleVoicemailDetectionPlan }
      member -> { Vapi::Types::OpenAiVoicemailDetectionPlan }
      member -> { Vapi::Types::TwilioVoicemailDetectionPlan }
      member -> { Vapi::Types::VapiVoicemailDetectionPlan }
    end
  end
end
