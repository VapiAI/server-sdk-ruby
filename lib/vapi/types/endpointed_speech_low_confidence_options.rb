# frozen_string_literal: true

module Vapi
  module Types
    class EndpointedSpeechLowConfidenceOptions < Internal::Types::Model
      field :confidence_min, -> { Integer }, optional: true, nullable: false, api_name: "confidenceMin"
      field :confidence_max, -> { Integer }, optional: true, nullable: false, api_name: "confidenceMax"
    end
  end
end
