# frozen_string_literal: true

module Vapi
  module Types
    class FallbackTranscriberPlanTranscribersItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :provider

      member -> { Vapi::Types::FallbackAssemblyAiTranscriber }, key: "ASSEMBLY_AI"
      member -> { Vapi::Types::FallbackAzureSpeechTranscriber }, key: "AZURE"
      member -> { Vapi::Types::FallbackCustomTranscriber }, key: "CUSTOM_TRANSCRIBER"
      member -> { Vapi::Types::FallbackDeepgramTranscriber }, key: "DEEPGRAM"
      member -> { Vapi::Types::FallbackElevenLabsTranscriber }, key: "_11_LABS"
      member -> { Vapi::Types::FallbackGladiaTranscriber }, key: "GLADIA"
      member -> { Vapi::Types::FallbackGoogleTranscriber }, key: "GOOGLE"
      member -> { Vapi::Types::FallbackTalkscriberTranscriber }, key: "TALKSCRIBER"
      member -> { Vapi::Types::FallbackSpeechmaticsTranscriber }, key: "SPEECHMATICS"
      member -> { Vapi::Types::FallbackOpenAiTranscriber }, key: "OPENAI"
      member -> { Vapi::Types::FallbackCartesiaTranscriber }, key: "CARTESIA"
      member -> { Vapi::Types::FallbackSonioxTranscriber }, key: "SONIOX"
    end
  end
end
