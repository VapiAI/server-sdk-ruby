# frozen_string_literal: true

module Vapi
  module Types
    # Start, end, and timezone used to limit an insight query by time.
    class InsightTimeRange < Internal::Types::Model
      field :start, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :end_, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "end"
      field :timezone, -> { String }, optional: true, nullable: false
    end
  end
end
