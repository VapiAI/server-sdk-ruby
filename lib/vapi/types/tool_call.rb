# frozen_string_literal: true

module Vapi
  module Types
    # A tool invocation requested by the assistant, including its identifier, type, and function details.
    class ToolCall < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :type, -> { String }, optional: false, nullable: false
      field :function, -> { Vapi::Types::ToolCallFunction }, optional: false, nullable: false
    end
  end
end
