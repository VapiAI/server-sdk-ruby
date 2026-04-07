# frozen_string_literal: true

module Vapi
  module Types
    class ServerMessageResponseHandoffDestinationRequest < Internal::Types::Model
      field :result, -> { String }, optional: true, nullable: false
      field :destination, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :error, -> { String }, optional: true, nullable: false
    end
  end
end
