# frozen_string_literal: true

module Vapi
  module Types
    # Controls how long a hook waits for customer speech, how often it can trigger, and when its trigger counter resets.
    class CustomerSpeechTimeoutOptions < Internal::Types::Model
      field :trigger_reset_mode, -> { Vapi::Types::CustomerSpeechTimeoutOptionsTriggerResetMode }, optional: true, nullable: false, api_name: "triggerResetMode"
      field :timeout_seconds, -> { Integer }, optional: false, nullable: false, api_name: "timeoutSeconds"
      field :trigger_max_count, -> { Integer }, optional: true, nullable: false, api_name: "triggerMaxCount"
    end
  end
end
