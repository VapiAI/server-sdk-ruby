# frozen_string_literal: true

module Vapi
  module Types
    class ToolRejectionPlanConditionsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::RegexCondition }, key: "REGEX"
      member -> { Vapi::Types::LiquidCondition }, key: "LIQUID"
      member -> { Vapi::Types::GroupCondition }, key: "GROUP"
    end
  end
end
