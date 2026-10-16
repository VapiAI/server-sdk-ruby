# frozen_string_literal: true

module Vapi
  module Types
    class ToolDraftPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::ToolDraft] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::ToolDraftPaginatedMetadata }, optional: false, nullable: false
    end
  end
end
