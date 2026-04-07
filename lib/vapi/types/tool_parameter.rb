# frozen_string_literal: true

module Vapi
  module Types
    class ToolParameter < Internal::Types::Model
      field :key, -> { String }, optional: false, nullable: false
      field :value, -> { Vapi::Types::ToolParameterValue }, optional: false, nullable: false
    end
  end
end
