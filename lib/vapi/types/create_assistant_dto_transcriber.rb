# frozen_string_literal: true

module Vapi
  module Types
    # These are the options for the assistant's transcriber.
    class CreateAssistantDtoTranscriber < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :provider

      member -> { Vapi::Types::AssemblyAiTranscriber }, key: "ASSEMBLY_AI"
      member -> { Vapi::Types::AzureSpeechTranscriber }, key: "AZURE"
      member -> { Vapi::Types::CustomTranscriber }, key: "CUSTOM_TRANSCRIBER"
      member -> { Vapi::Types::DeepgramTranscriber }, key: "DEEPGRAM"
      member -> { Vapi::Types::ElevenLabsTranscriber }, key: "_11_LABS"
      member -> { Vapi::Types::GladiaTranscriber }, key: "GLADIA"
      member -> { Vapi::Types::GoogleTranscriber }, key: "GOOGLE"
      member -> { Vapi::Types::SpeechmaticsTranscriber }, key: "SPEECHMATICS"
      member -> { Vapi::Types::TalkscriberTranscriber }, key: "TALKSCRIBER"
      member -> { Vapi::Types::OpenAiTranscriber }, key: "OPENAI"
      member -> { Vapi::Types::CartesiaTranscriber }, key: "CARTESIA"
      member -> { Vapi::Types::SonioxTranscriber }, key: "SONIOX"
    end
  end
end
