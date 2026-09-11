# frozen_string_literal: true

module Vapi
  module Types
    # Result of evaluating an attached monitor's filter for a call.
    class MonitorResult < Internal::Types::Model
      field :monitor_id, -> { String }, optional: false, nullable: false, api_name: "monitorId"
      field :filter_passed, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "filterPassed"
    end
  end
end
