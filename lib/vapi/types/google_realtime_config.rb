# frozen_string_literal: true

module Vapi
  module Types
    class GoogleRealtimeConfig < Internal::Types::Model
      field :top_p, -> { Integer }, optional: true, nullable: false, api_name: "topP"
      field :top_k, -> { Integer }, optional: true, nullable: false, api_name: "topK"
      field :presence_penalty, -> { Integer }, optional: true, nullable: false, api_name: "presencePenalty"
      field :frequency_penalty, -> { Integer }, optional: true, nullable: false, api_name: "frequencyPenalty"
      field :speech_config, -> { Vapi::Types::GeminiMultimodalLiveSpeechConfig }, optional: true, nullable: false, api_name: "speechConfig"
    end
  end
end
