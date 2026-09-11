# frozen_string_literal: true

module Vapi
  module Types
    class AssistantDraftPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::AssistantDraft] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::AssistantDraftPaginatedMetadata }, optional: false, nullable: false
    end
  end
end
