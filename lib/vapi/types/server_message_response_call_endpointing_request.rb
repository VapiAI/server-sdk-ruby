# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageResponseCallEndpointingRequest < Internal::Types::Model
      field :timeout_seconds, -> { Integer }, optional: false, nullable: false, api_name: "timeoutSeconds"
    end
  end
end
