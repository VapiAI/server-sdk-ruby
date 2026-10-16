# frozen_string_literal: true

module Vapi
  module Types
    # Selects whether an insight run returns raw data or Recharts-formatted data.
    class InsightRunFormatPlan < Internal::Types::Model
      field :format, -> { Vapi::Types::InsightRunFormatPlanFormat }, optional: true, nullable: false
    end
  end
end
