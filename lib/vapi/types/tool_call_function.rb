# frozen_string_literal: true

module Vapi
  module Types
    # The function name and serialized arguments associated with a tool call.
    class ToolCallFunction < Internal::Types::Model
      field :arguments, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
