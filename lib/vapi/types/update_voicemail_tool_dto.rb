# frozen_string_literal: true

module Vapi
  module Types
    # Fields used to update a voicemail-detection tool, including beep detection, spoken messages, and rejection plan.
    class UpdateVoicemailToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateVoicemailToolDtoMessagesItem] }, optional: true, nullable: false
      field :beep_detection_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "beepDetectionEnabled"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
