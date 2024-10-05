# frozen_string_literal: true

require "json"
require_relative "tool_message_start"
require_relative "tool_message_complete"
require_relative "tool_message_failed"
require_relative "tool_message_delayed"

module Vapi
  class MakeToolMessagesItem
    # Deserialize a JSON object to an instance of MakeToolMessagesItem
    #
    # @param json_object [String]
    # @return [Vapi::MakeToolMessagesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::ToolMessageStart.validate_raw(obj: struct)
        return Vapi::ToolMessageStart.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ToolMessageComplete.validate_raw(obj: struct)
        return Vapi::ToolMessageComplete.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ToolMessageFailed.validate_raw(obj: struct)
        return Vapi::ToolMessageFailed.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ToolMessageDelayed.validate_raw(obj: struct)
        return Vapi::ToolMessageDelayed.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::ToolMessageStart.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ToolMessageComplete.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ToolMessageFailed.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ToolMessageDelayed.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
