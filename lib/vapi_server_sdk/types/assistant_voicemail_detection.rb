# frozen_string_literal: true

require "json"
require_relative "google_voicemail_detection_plan"
require_relative "open_ai_voicemail_detection_plan"
require_relative "twilio_voicemail_detection_plan"
require_relative "vapi_voicemail_detection_plan"

module Vapi
  # These are the settings to configure or disable voicemail detection.
  #  Alternatively, voicemail detection can be configured using the
  #  model.tools=[VoicemailTool].
  #  By default, voicemail detection is disabled.
  class AssistantVoicemailDetection
    # Deserialize a JSON object to an instance of AssistantVoicemailDetection
    #
    # @param json_object [String]
    # @return [Vapi::AssistantVoicemailDetection]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        struct.is_a?(Vapi::AssistantVoicemailDetectionZero) != false || raise("Passed value for field struct is not the expected type, validation failed.")
        return struct unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::GoogleVoicemailDetectionPlan.validate_raw(obj: struct)
        return Vapi::GoogleVoicemailDetectionPlan.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::OpenAiVoicemailDetectionPlan.validate_raw(obj: struct)
        return Vapi::OpenAiVoicemailDetectionPlan.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::TwilioVoicemailDetectionPlan.validate_raw(obj: struct)
        return Vapi::TwilioVoicemailDetectionPlan.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::VapiVoicemailDetectionPlan.validate_raw(obj: struct)
        return Vapi::VapiVoicemailDetectionPlan.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      struct
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return obj.is_a?(Vapi::AssistantVoicemailDetectionZero) != false || raise("Passed value for field obj is not the expected type, validation failed.")
      rescue StandardError
        # noop
      end
      begin
        return Vapi::GoogleVoicemailDetectionPlan.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::OpenAiVoicemailDetectionPlan.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::TwilioVoicemailDetectionPlan.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::VapiVoicemailDetectionPlan.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
