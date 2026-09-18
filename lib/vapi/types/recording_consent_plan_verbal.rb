# frozen_string_literal: true

module Vapi
  module Types
    # Configuration for requesting explicit verbal recording consent, including the announcement voice and action to
    # take when the customer declines.
    class RecordingConsentPlanVerbal < Internal::Types::Model
      field :message, -> { String }, optional: false, nullable: false
      field :voice, -> { Vapi::Types::RecordingConsentPlanVerbalVoice }, optional: true, nullable: false
      field :first_message_mode, -> { Vapi::Types::RecordingConsentPlanVerbalFirstMessageMode }, optional: true, nullable: false, api_name: "firstMessageMode"
      field :decline_tool, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "declineTool"
      field :decline_tool_id, -> { String }, optional: true, nullable: false, api_name: "declineToolId"
    end
  end
end
