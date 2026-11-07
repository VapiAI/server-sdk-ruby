# frozen_string_literal: true

module Vapi
  module Types
    class AssistantVersionPaginatedResponse < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::AssistantVersion] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::AssistantVersionPaginatedMetadata }, optional: false, nullable: false
    end
  end
end
