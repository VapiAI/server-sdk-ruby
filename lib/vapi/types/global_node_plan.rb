# frozen_string_literal: true

module Vapi
  module Types
    class GlobalNodePlan < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enter_condition, -> { String }, optional: true, nullable: false, api_name: "enterCondition"
    end
  end
end
