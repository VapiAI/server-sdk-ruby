# frozen_string_literal: true

module Vapi
  module Types
    class SquadVersion < Internal::Types::Model
      field :version_name, -> { String }, optional: true, nullable: false, api_name: "versionName"
      field :version_description, -> { String }, optional: true, nullable: false, api_name: "versionDescription"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :squad_id, -> { String }, optional: false, nullable: false, api_name: "squadId"
      field :version, -> { String }, optional: false, nullable: false
      field :config_hash, -> { String }, optional: false, nullable: false, api_name: "configHash"
      field :parent_version, -> { String }, optional: true, nullable: false, api_name: "parentVersion"
      field :restored_from_version, -> { String }, optional: true, nullable: false, api_name: "restoredFromVersion"
      field :created_by, -> { String }, optional: true, nullable: false, api_name: "createdBy"
      field :deleted_at, -> { String }, optional: true, nullable: false, api_name: "deletedAt"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :name, -> { String }, optional: true, nullable: false
      field :members, -> { Internal::Types::Array[Vapi::Types::SquadMemberDto] }, optional: false, nullable: false
      field :members_overrides, -> { Vapi::Types::AssistantOverrides }, optional: true, nullable: false, api_name: "membersOverrides"
    end
  end
end
