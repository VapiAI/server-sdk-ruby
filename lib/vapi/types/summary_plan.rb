# frozen_string_literal: true

module Vapi
  module Types
    # Controls generation of a post-call summary, including prompt messages, enablement, and request timeout.
    class SummaryPlan < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "timeoutSeconds"
    end
  end
end
