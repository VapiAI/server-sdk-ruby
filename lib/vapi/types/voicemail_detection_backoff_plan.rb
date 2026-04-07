# frozen_string_literal: true

module Vapi
  module Types
    class VoicemailDetectionBackoffPlan < Internal::Types::Model
      field :start_at_seconds, -> { Integer }, optional: true, nullable: false, api_name: "startAtSeconds"
      field :frequency_seconds, -> { Integer }, optional: true, nullable: false, api_name: "frequencySeconds"
      field :max_retries, -> { Integer }, optional: true, nullable: false, api_name: "maxRetries"
    end
  end
end
