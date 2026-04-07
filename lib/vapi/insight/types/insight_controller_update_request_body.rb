# frozen_string_literal: true

module Vapi
  module Insight
    module Types
      class InsightControllerUpdateRequestBody < Internal::Types::Model
        extend Vapi::Internal::Types::Union

        discriminant :type

        member -> { Vapi::Types::UpdateBarInsightFromCallTableDto }, key: "BAR"
        member -> { Vapi::Types::UpdatePieInsightFromCallTableDto }, key: "PIE"
        member -> { Vapi::Types::UpdateLineInsightFromCallTableDto }, key: "LINE"
        member -> { Vapi::Types::UpdateTextInsightFromCallTableDto }, key: "TEXT"
      end
    end
  end
end
