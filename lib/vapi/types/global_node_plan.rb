# frozen_string_literal: true

module Vapi
  module Types
    # Controls whether a conversation node can be entered globally and the condition evaluated before that node runs.
    class GlobalNodePlan < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :enter_condition, -> { String }, optional: true, nullable: false, api_name: "enterCondition"
    end
  end
end
