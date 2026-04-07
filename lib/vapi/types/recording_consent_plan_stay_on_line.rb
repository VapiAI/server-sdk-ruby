# frozen_string_literal: true

module Vapi
  module Types
    class RecordingConsentPlanStayOnLine < Internal::Types::Model
      field :message, -> { String }, optional: false, nullable: false
      field :voice, -> { Vapi::Types::RecordingConsentPlanStayOnLineVoice }, optional: true, nullable: false
      field :wait_seconds, -> { Integer }, optional: true, nullable: false, api_name: "waitSeconds"
    end
  end
end
