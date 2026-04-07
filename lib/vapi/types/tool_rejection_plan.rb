# frozen_string_literal: true

module Vapi
  module Types
    class ToolRejectionPlan < Internal::Types::Model
      field :conditions, -> { Internal::Types::Array[Vapi::Types::ToolRejectionPlanConditionsItem] }, optional: true, nullable: false
    end
  end
end
