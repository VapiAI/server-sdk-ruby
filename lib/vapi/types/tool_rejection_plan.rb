# frozen_string_literal: true

module Vapi
  module Types
    # Conditions evaluated to determine whether a requested tool call should be rejected.
    class ToolRejectionPlan < Internal::Types::Model
      field :conditions, -> { Internal::Types::Array[Vapi::Types::ToolRejectionPlanConditionsItem] }, optional: true, nullable: false
    end
  end
end
