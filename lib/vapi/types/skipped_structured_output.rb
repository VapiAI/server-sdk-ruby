# frozen_string_literal: true

module Vapi
  module Types
    class SkippedStructuredOutput < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :unmet_condition, -> { Vapi::Types::SkippedStructuredOutputUnmetCondition }, optional: false, nullable: false, api_name: "unmetCondition"
    end
  end
end
