# frozen_string_literal: true

module Vapi
  module Types
    class ConflictErrorBody < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :error

      member -> { Vapi::Types::ToolPinnedConflictResponseDto }, key: "TOOL_PINNED"
      member -> { Vapi::Types::ToolWriteConflictResponseDto }, key: "TOOL_WRITE_CONFLICT"
    end
  end
end
