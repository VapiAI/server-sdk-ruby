# frozen_string_literal: true

module Vapi
  module Types
    # Uses a webhook response to select the handoff destination at runtime.
    class HandoffDestinationDynamic < Internal::Types::Model
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
