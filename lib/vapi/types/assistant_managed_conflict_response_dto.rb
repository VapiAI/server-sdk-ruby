# frozen_string_literal: true

module Vapi
  module Types
    class AssistantManagedConflictResponseDto < Internal::Types::Model
      field :error, -> { Vapi::Types::AssistantManagedConflictResponseDtoError }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
      field :vapi_agents, -> { Vapi::Types::AssistantManagedVapiAgentsDto }, optional: false, nullable: false, api_name: "vapiAgents"
    end
  end
end
