# frozen_string_literal: true

module Vapi
  module StructuredOutputs
    module Types
      class StructuredOutputRunDto < Internal::Types::Model
        field :preview_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "previewEnabled"
        field :structured_output_id, -> { String }, optional: true, nullable: false, api_name: "structuredOutputId"
        field :structured_output, -> { Vapi::Types::CreateStructuredOutputDto }, optional: true, nullable: false, api_name: "structuredOutput"
        field :call_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "callIds"
      end
    end
  end
end
