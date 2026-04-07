# frozen_string_literal: true

module Vapi
  module Types
    # This is the voice to use for the consent message. If not specified, inherits from the assistant's voice.
    # Use a different voice for the consent message for a better user experience.
    class RecordingConsentPlanStayOnLineVoice < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :provider

      member -> { Vapi::Types::AzureVoice }, key: "AZURE"
      member -> { Vapi::Types::CartesiaVoice }, key: "CARTESIA"
      member -> { Vapi::Types::CustomVoice }, key: "CUSTOM_VOICE"
      member -> { Vapi::Types::DeepgramVoice }, key: "DEEPGRAM"
      member -> { Vapi::Types::ElevenLabsVoice }, key: "_11_LABS"
      member -> { Vapi::Types::HumeVoice }, key: "HUME"
      member -> { Vapi::Types::LmntVoice }, key: "LMNT"
      member -> { Vapi::Types::NeuphonicVoice }, key: "NEUPHONIC"
      member -> { Vapi::Types::OpenAiVoice }, key: "OPENAI"
      member -> { Vapi::Types::PlayHtVoice }, key: "PLAYHT"
      member -> { Vapi::Types::WellSaidVoice }, key: "WELLSAID"
      member -> { Vapi::Types::RimeAiVoice }, key: "RIME_AI"
      member -> { Vapi::Types::SmallestAiVoice }, key: "SMALLEST_AI"
      member -> { Vapi::Types::TavusVoice }, key: "TAVUS"
      member -> { Vapi::Types::VapiVoice }, key: "VAPI"
      member -> { Vapi::Types::SesameVoice }, key: "SESAME"
      member -> { Vapi::Types::InworldVoice }, key: "INWORLD"
      member -> { Vapi::Types::MinimaxVoice }, key: "MINIMAX"
    end
  end
end
