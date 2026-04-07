# frozen_string_literal: true

module Vapi
  module Insight
    module Types
      class InsightControllerCreateResponse < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        discriminant :type

        member -> { Vapi::Types::BarInsight }, key: "BAR"
        member -> { Vapi::Types::PieInsight }, key: "PIE"
        member -> { Vapi::Types::LineInsight }, key: "LINE"
        member -> { Vapi::Types::TextInsight }, key: "TEXT"
      end
    end
  end
end
