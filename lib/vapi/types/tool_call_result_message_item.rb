# frozen_string_literal: true

require "json"
require_relative "tool_message_complete"
require_relative "tool_message_failed"

module Vapi
  class ToolCallResultMessageItem
    # Deserialize a JSON object to an instance of ToolCallResultMessageItem
    #
    # @param json_object [String]
    # @return [Vapi::ToolCallResultMessageItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
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
        return Vapi::ToolMessageComplete.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ToolMessageFailed.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
