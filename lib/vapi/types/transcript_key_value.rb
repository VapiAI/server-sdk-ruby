# frozen_string_literal: true

module Vapi
  module Types
    class TranscriptKeyValue < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false
      field :accepted_variants, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "acceptedVariants"
      field :required, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
