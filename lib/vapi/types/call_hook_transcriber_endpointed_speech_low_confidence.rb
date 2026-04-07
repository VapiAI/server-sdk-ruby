# frozen_string_literal: true

module Vapi
  module Types
    class CallHookTranscriberEndpointedSpeechLowConfidence < Internal::Types::Model
      field :do_, -> { Internal::Types::Array[Vapi::Types::CallHookTranscriberEndpointedSpeechLowConfidenceDoItem] }, optional: false, nullable: false, api_name: "do"
      field :on, -> { String }, optional: false, nullable: false
      field :options, -> { Vapi::Types::EndpointedSpeechLowConfidenceOptions }, optional: true, nullable: false
    end
  end
end
