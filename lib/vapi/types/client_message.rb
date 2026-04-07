# frozen_string_literal: true

module Vapi
  module Types
    class ClientMessage < Internal::Types::Model
      field :message, -> { Vapi::Types::ClientMessageMessage }, optional: false, nullable: false
    end
  end
end
