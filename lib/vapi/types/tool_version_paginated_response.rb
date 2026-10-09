# frozen_string_literal: true

module Vapi
  module Types
    class ToolVersionPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::ToolVersion] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::ToolVersionPaginatedMetadata }, optional: false, nullable: false
    end
  end
end
