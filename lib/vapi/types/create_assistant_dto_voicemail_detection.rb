# frozen_string_literal: true

module Vapi
  module Types
    # These are the settings to configure or disable voicemail detection. Alternatively, voicemail detection can be
    # configured using the model.tools=[VoicemailTool].
    # By default, voicemail detection is disabled.
    class CreateAssistantDtoVoicemailDetection < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::CreateAssistantDtoVoicemailDetectionZero }
      member -> { Vapi::Types::GoogleVoicemailDetectionPlan }
      member -> { Vapi::Types::OpenAiVoicemailDetectionPlan }
      member -> { Vapi::Types::TwilioVoicemailDetectionPlan }
      member -> { Vapi::Types::VapiVoicemailDetectionPlan }
    end
  end
end
