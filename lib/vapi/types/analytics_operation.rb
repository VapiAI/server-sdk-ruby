# frozen_string_literal: true

module Vapi
  module Types
    class AnalyticsOperation < Internal::Types::Model
      field :operation, -> { Vapi::Types::AnalyticsOperationOperation }, optional: false, nullable: false
      field :column, -> { Vapi::Types::AnalyticsOperationColumn }, optional: false, nullable: false
      field :alias_, -> { String }, optional: true, nullable: false, api_name: "alias"
    end
  end
end
