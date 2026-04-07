# frozen_string_literal: true

module Vapi
  module Types
    class InsightRunFormatPlan < Internal::Types::Model
      field :format, -> { Vapi::Types::InsightRunFormatPlanFormat }, optional: true, nullable: false
    end
  end
end
