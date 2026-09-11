# frozen_string_literal: true

module Vapi
  module Types
    # Includes a configured number of the most recent messages when constructing context for a handoff.
    class ContextEngineeringPlanLastNMessages < Internal::Types::Model
      field :max_messages, -> { Integer }, optional: false, nullable: false, api_name: "maxMessages"
    end
  end
end
