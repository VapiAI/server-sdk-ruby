# frozen_string_literal: true

module Vapi
  module Types
    class GhlToolMetadata < Internal::Types::Model
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :location_id, -> { String }, optional: true, nullable: false, api_name: "locationId"
    end
  end
end
