# frozen_string_literal: true

module Vapi
  module Types
    class ToolWriteConflictResponseDto < Internal::Types::Model
      field :error, -> { Vapi::Types::ToolWriteConflictResponseDtoError }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
    end
  end
end
