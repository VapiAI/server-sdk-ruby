# frozen_string_literal: true

module Vapi
  module Types
    class ToolCall < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :type, -> { String }, optional: false, nullable: false
      field :function, -> { Vapi::Types::ToolCallFunction }, optional: false, nullable: false
    end
  end
end
