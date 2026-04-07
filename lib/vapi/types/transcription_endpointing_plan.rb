# frozen_string_literal: true

module Vapi
  module Types
    class TranscriptionEndpointingPlan < Internal::Types::Model
      field :on_punctuation_seconds, -> { Integer }, optional: true, nullable: false, api_name: "onPunctuationSeconds"
      field :on_no_punctuation_seconds, -> { Integer }, optional: true, nullable: false, api_name: "onNoPunctuationSeconds"
      field :on_number_seconds, -> { Integer }, optional: true, nullable: false, api_name: "onNumberSeconds"
    end
  end
end
