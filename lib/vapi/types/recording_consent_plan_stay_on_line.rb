# frozen_string_literal: true

module Vapi
  module Types
    # Configuration for requesting recording consent by treating continued presence on the call as consent, including
    # the announcement voice and wait time.
    class RecordingConsentPlanStayOnLine < Internal::Types::Model
      field :message, -> { String }, optional: false, nullable: false
      field :voice, -> { Vapi::Types::RecordingConsentPlanStayOnLineVoice }, optional: true, nullable: false
      field :first_message_mode, -> { Vapi::Types::RecordingConsentPlanStayOnLineFirstMessageMode }, optional: true, nullable: false, api_name: "firstMessageMode"
      field :wait_seconds, -> { Integer }, optional: true, nullable: false, api_name: "waitSeconds"
    end
  end
end
