# frozen_string_literal: true

module Vapi
  module Types
    class TrafficTabCostPerMinuteDto < Internal::Types::Model
      field :mean, -> { Integer }, optional: true, nullable: false
      field :breakdown, -> { Vapi::Types::TrafficTabCostBreakdownPerMinuteDto }, optional: false, nullable: false
    end
  end
end
