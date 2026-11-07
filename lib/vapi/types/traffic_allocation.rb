# frozen_string_literal: true

module Vapi
  module Types
    class TrafficAllocation < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
      field :allocation_intent, -> { Vapi::Types::TrafficAllocationAllocationIntent }, optional: false, nullable: false, api_name: "allocationIntent"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :actor_type, -> { Vapi::Types::TrafficAllocationActorType }, optional: false, nullable: false, api_name: "actorType"
      field :actor_id, -> { String }, optional: true, nullable: false, api_name: "actorId"
      field :actor_email, -> { String }, optional: true, nullable: false, api_name: "actorEmail"
      field :description, -> { String }, optional: true, nullable: false
      field :targets, -> { Internal::Types::Array[Vapi::Types::TrafficAllocationTarget] }, optional: false, nullable: false
    end
  end
end
