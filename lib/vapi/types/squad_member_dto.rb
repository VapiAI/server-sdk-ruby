# frozen_string_literal: true

module Vapi
  module Types
    # An assistant member of a squad. Reference a saved assistant or provide a transient assistant, then configure
    # member-specific overrides and destinations for transfers.
    class SquadMemberDto < Internal::Types::Model
      field :assistant_version, -> { String }, optional: true, nullable: false, api_name: "assistantVersion"
      field :assistant_destinations, -> { Internal::Types::Array[Vapi::Types::SquadMemberDtoAssistantDestinationsItem] }, optional: true, nullable: false, api_name: "assistantDestinations"
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :assistant_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "assistantOverrides"
    end
  end
end
