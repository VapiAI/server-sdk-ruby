# frozen_string_literal: true

module Vapi
  module Types
    class EvalRunTargetSquad < Internal::Types::Model
      field :squad, -> { Vapi::Types::CreateSquadDto }, optional: true, nullable: false
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
      field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
    end
  end
end
