# frozen_string_literal: true

module Vapi
  module Types
    class AssistantSpeechWordTimestamp < Internal::Types::Model
      field :word, -> { String }, optional: false, nullable: false
      field :start_ms, -> { Integer }, optional: false, nullable: false, api_name: "startMs"
      field :end_ms, -> { Integer }, optional: false, nullable: false, api_name: "endMs"
    end
  end
end
