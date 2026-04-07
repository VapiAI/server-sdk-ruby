# frozen_string_literal: true

module Vapi
  module Types
    class FallbackPlanVoicesItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :provider

      member -> { Vapi::Types::FallbackAzureVoice }, key: "AZURE"
      member -> { Vapi::Types::FallbackCartesiaVoice }, key: "CARTESIA"
      member -> { Vapi::Types::FallbackHumeVoice }, key: "HUME"
      member -> { Vapi::Types::FallbackCustomVoice }, key: "CUSTOM_VOICE"
      member -> { Vapi::Types::FallbackDeepgramVoice }, key: "DEEPGRAM"
      member -> { Vapi::Types::FallbackElevenLabsVoice }, key: "_11_LABS"
      member -> { Vapi::Types::FallbackVapiVoice }, key: "VAPI"
      member -> { Vapi::Types::FallbackLmntVoice }, key: "LMNT"
      member -> { Vapi::Types::FallbackOpenAiVoice }, key: "OPENAI"
      member -> { Vapi::Types::FallbackPlayHtVoice }, key: "PLAYHT"
      member -> { Vapi::Types::FallbackWellSaidVoice }, key: "WELLSAID"
      member -> { Vapi::Types::FallbackRimeAiVoice }, key: "RIME_AI"
      member -> { Vapi::Types::FallbackSmallestAiVoice }, key: "SMALLEST_AI"
      member -> { Vapi::Types::FallbackTavusVoice }, key: "TAVUS"
      member -> { Vapi::Types::FallbackNeuphonicVoice }, key: "NEUPHONIC"
      member -> { Vapi::Types::FallbackSesameVoice }, key: "SESAME"
      member -> { Vapi::Types::FallbackInworldVoice }, key: "INWORLD"
    end
  end
end
