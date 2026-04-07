# frozen_string_literal: true

module Vapi
  module Types
    class ContextEngineeringPlanLastNMessages < Internal::Types::Model
      field :max_messages, -> { Integer }, optional: false, nullable: false, api_name: "maxMessages"
    end
  end
end
