# frozen_string_literal: true

module Vapi
  module Types
    # Static key-value parameter added to a tool request, with Liquid template support for string values.
    class ToolParameter < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false
      field :value, -> { Vapi::Types::ToolParameterValue }, optional: false, nullable: false
    end
  end
end
