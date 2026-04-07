# frozen_string_literal: true

module Vapi
  module Types
    class TransferAssistant < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :model, -> { Vapi::Types::TransferAssistantModel }, optional: false, nullable: false
      field :voice, -> { Vapi::Types::TransferAssistantVoice }, optional: true, nullable: false
      field :transcriber, -> { Vapi::Types::TransferAssistantTranscriber }, optional: true, nullable: false
      field :first_message, -> { String }, optional: true, nullable: false, api_name: "firstMessage"
      field :background_sound, -> { Vapi::Types::TransferAssistantBackgroundSound }, optional: true, nullable: false, api_name: "backgroundSound"
      field :start_speaking_plan, -> { Vapi::Types::StartSpeakingPlan }, optional: true, nullable: false, api_name: "startSpeakingPlan"
      field :first_message_mode, -> { Vapi::Types::TransferAssistantFirstMessageMode }, optional: true, nullable: false, api_name: "firstMessageMode"
      field :max_duration_seconds, -> { Integer }, optional: true, nullable: false, api_name: "maxDurationSeconds"
      field :background_speech_denoising_plan, -> { Vapi::Types::BackgroundSpeechDenoisingPlan }, optional: true, nullable: false, api_name: "backgroundSpeechDenoisingPlan"
      field :silence_timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "silenceTimeoutSeconds"
    end
  end
end
