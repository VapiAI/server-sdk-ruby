# frozen_string_literal: true

module Vapi
  module Types
    class SecurityFilterPlan < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :filters, -> { Internal::Types::Array[Vapi::Types::SecurityFilterBase] }, optional: true, nullable: false
      field :mode, -> { Vapi::Types::SecurityFilterPlanMode }, optional: true, nullable: false
      field :replacement_text, -> { String }, optional: true, nullable: false, api_name: "replacementText"
    end
  end
end
