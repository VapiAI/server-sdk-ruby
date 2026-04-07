# frozen_string_literal: true

module Vapi
  module Types
    class Squad < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :members, -> { Internal::Types::Array[Vapi::Types::SquadMemberDto] }, optional: false, nullable: false
      field :members_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "membersOverrides"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
