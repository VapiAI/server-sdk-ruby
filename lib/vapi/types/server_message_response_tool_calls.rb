# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageResponseToolCalls < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::ToolCallResult] }, optional: true, nullable: false
      field :error, -> { String }, optional: true, nullable: false
    end
  end
end
