# frozen_string_literal: true

module Vapi
  module Types
    # GHL workflow and location identifiers attached to a tool.
    class GhlToolMetadata < Internal::Types::Model
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :location_id, -> { String }, optional: true, nullable: false, api_name: "locationId"
    end
  end
end
