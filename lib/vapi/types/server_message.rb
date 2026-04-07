# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessage < Internal::Types::Model
      field :message, -> { Vapi::Types::ServerMessageMessage }, optional: false, nullable: false
    end
  end
end
