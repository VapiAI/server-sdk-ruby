# frozen_string_literal: true

module Vapi
  module Types
    class SmartDenoisingPlan < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
