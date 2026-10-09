# frozen_string_literal: true

module Vapi
  module Types
    class AssistantPinnedConflictResponseDto < Internal::Types::Model
      field :error, -> { Vapi::Types::AssistantPinnedConflictResponseDtoError }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
    end
  end
end
