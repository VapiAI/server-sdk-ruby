# frozen_string_literal: true

module Vapi
  module Types
    class TrafficTabCostBreakdownPerMinuteDto < Internal::Types::Model
      field :llm, -> { Integer }, optional: true, nullable: false
      field :stt, -> { Integer }, optional: true, nullable: false
      field :tts, -> { Integer }, optional: true, nullable: false
      field :vapi, -> { Integer }, optional: true, nullable: false
      field :transport, -> { Integer }, optional: true, nullable: false
    end
  end
end
