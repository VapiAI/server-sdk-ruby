# frozen_string_literal: true

module Vapi
  module Types
    class LatencyMetrics < Internal::Types::Model
      field :turn_count, -> { Integer }, optional: false, nullable: false, api_name: "turnCount"
      field :avg_turn, -> { Integer }, optional: true, nullable: false, api_name: "avgTurn"
      field :avg_transcriber, -> { Integer }, optional: true, nullable: false, api_name: "avgTranscriber"
      field :avg_model, -> { Integer }, optional: true, nullable: false, api_name: "avgModel"
      field :avg_voice, -> { Integer }, optional: true, nullable: false, api_name: "avgVoice"
      field :avg_endpointing, -> { Integer }, optional: true, nullable: false, api_name: "avgEndpointing"
    end
  end
end
