# frozen_string_literal: true

module Vapi
  module Types
    class Reson8Transcriber < Internal::Types::Model
      field :model, -> { Vapi::Types::Reson8TranscriberModel }, optional: true, nullable: false
      field :language, -> { String }, optional: true, nullable: false
      field :keyterms, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :custom_model_id, -> { String }, optional: true, nullable: false, api_name: "customModelId"
      field :eager_turn_probability, -> { Integer }, optional: true, nullable: false, api_name: "eagerTurnProbability"
      field :final_turn_probability, -> { Integer }, optional: true, nullable: false, api_name: "finalTurnProbability"
      field :filler_mode, -> { Vapi::Types::Reson8TranscriberFillerMode }, optional: true, nullable: false, api_name: "fillerMode"
      field :fallback_plan, -> { Vapi::Types::FallbackTranscriberPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
