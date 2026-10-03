# frozen_string_literal: true

module Vapi
  module Types
    class AudioFormat < Internal::Types::Model
      field :sample_rate, -> { Integer }, optional: false, nullable: false, api_name: "sampleRate"
      field :format, -> { Vapi::Types::AudioFormatFormat }, optional: false, nullable: false
      field :container, -> { Vapi::Types::AudioFormatContainer }, optional: true, nullable: false
    end
  end
end
