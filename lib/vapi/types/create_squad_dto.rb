# frozen_string_literal: true

module Vapi
  module Types
    class CreateSquadDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :members, -> { Internal::Types::Array[Vapi::Types::SquadMemberDto] }, optional: false, nullable: false
      field :members_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "membersOverrides"
    end
  end
end
