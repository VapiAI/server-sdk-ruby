# frozen_string_literal: true

require "json"
require_relative "call_hook_call_ending"
require_relative "call_hook_assistant_speech_interrupted"
require_relative "call_hook_customer_speech_interrupted"
require_relative "call_hook_customer_speech_timeout"
require_relative "call_hook_model_response_timeout"

module Vapi
  class WorkflowUserEditableHooksItem
    # Deserialize a JSON object to an instance of WorkflowUserEditableHooksItem
    #
    # @param json_object [String]
    # @return [Vapi::WorkflowUserEditableHooksItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::CallHookCallEnding.validate_raw(obj: struct)
        return Vapi::CallHookCallEnding.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::CallHookAssistantSpeechInterrupted.validate_raw(obj: struct)
        return Vapi::CallHookAssistantSpeechInterrupted.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::CallHookCustomerSpeechInterrupted.validate_raw(obj: struct)
        return Vapi::CallHookCustomerSpeechInterrupted.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::CallHookCustomerSpeechTimeout.validate_raw(obj: struct)
        return Vapi::CallHookCustomerSpeechTimeout.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::CallHookModelResponseTimeout.validate_raw(obj: struct)
        return Vapi::CallHookModelResponseTimeout.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::CallHookCallEnding.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CallHookAssistantSpeechInterrupted.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CallHookCustomerSpeechInterrupted.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CallHookCustomerSpeechTimeout.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CallHookModelResponseTimeout.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
