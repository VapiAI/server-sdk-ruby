# frozen_string_literal: true

module Vapi
  module Types
    class ToolCallResultMessageWarning < Internal::Types::Model
      field :type, -> { Vapi::Types::ToolCallResultMessageWarningType }, optional: false, nullable: false
      field :token_count, -> { Integer }, optional: false, nullable: false, api_name: "tokenCount"
      field :threshold, -> { Integer }, optional: false, nullable: false
    end
  end
end
