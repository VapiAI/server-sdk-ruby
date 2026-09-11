# frozen_string_literal: true

module Vapi
  module Types
    # Controls endpointing delays based on whether customer speech ends with punctuation, without punctuation, or with a
    # number.
    class TranscriptionEndpointingPlan < Internal::Types::Model
      field :on_punctuation_seconds, -> { Integer }, optional: true, nullable: false, api_name: "onPunctuationSeconds"
      field :on_no_punctuation_seconds, -> { Integer }, optional: true, nullable: false, api_name: "onNoPunctuationSeconds"
      field :on_number_seconds, -> { Integer }, optional: true, nullable: false, api_name: "onNumberSeconds"
    end
  end
end
