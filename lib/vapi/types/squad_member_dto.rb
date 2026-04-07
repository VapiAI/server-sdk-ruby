# frozen_string_literal: true

module Vapi
  module Types
    class SquadMemberDto < Internal::Types::Model
      field :assistant_destinations, -> { Internal::Types::Array[Vapi::Types::SquadMemberDtoAssistantDestinationsItem] }, optional: true, nullable: false, api_name: "assistantDestinations"
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
    end
  end
end
