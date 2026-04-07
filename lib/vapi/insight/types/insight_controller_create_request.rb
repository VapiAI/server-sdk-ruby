# frozen_string_literal: true

module Vapi
  module Insight
    module Types
      class InsightControllerCreateRequest < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        discriminant :type

        member -> { Vapi::Types::CreateBarInsightFromCallTableDto }, key: "BAR"
        member -> { Vapi::Types::CreatePieInsightFromCallTableDto }, key: "PIE"
        member -> { Vapi::Types::CreateLineInsightFromCallTableDto }, key: "LINE"
        member -> { Vapi::Types::CreateTextInsightFromCallTableDto }, key: "TEXT"
      end
    end
  end
end
