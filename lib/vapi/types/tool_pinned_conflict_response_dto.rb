# frozen_string_literal: true

module Vapi
  module Types
    class ToolPinnedConflictResponseDto < Internal::Types::Model
      field :error, -> { Vapi::Types::ToolPinnedConflictResponseDtoError }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
    end
  end
end
