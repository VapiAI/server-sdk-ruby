# frozen_string_literal: true

module Vapi
  module Types
    class StructuredOutputRerunResponse < Internal::Types::Model
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :message, -> { String }, optional: false, nullable: false
    end
  end
end
