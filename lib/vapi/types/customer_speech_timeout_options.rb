# frozen_string_literal: true

module Vapi
  module Types
    class CustomerSpeechTimeoutOptions < Internal::Types::Model
      field :timeout_seconds, -> { Integer }, optional: false, nullable: false, api_name: "timeoutSeconds"
      field :trigger_max_count, -> { Integer }, optional: true, nullable: false, api_name: "triggerMaxCount"
      field :trigger_reset_mode, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "triggerResetMode"
    end
  end
end
