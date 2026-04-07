# frozen_string_literal: true

module Vapi
  module Squads
    module Types
      class UpdateSquadDto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :members, -> { Internal::Types::Array[Vapi::Types::SquadMemberDto] }, optional: false, nullable: false
        field :members_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "membersOverrides"
      end
    end
  end
end
