# frozen_string_literal: true

require "json"
require_relative "user_message"
require_relative "system_message"
require_relative "bot_message"
require_relative "tool_call_message"
require_relative "tool_call_result_message"

module Vapi
  class CallMessagesItem
    # Deserialize a JSON object to an instance of CallMessagesItem
    #
    # @param json_object [String]
    # @return [Vapi::CallMessagesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::UserMessage.validate_raw(obj: struct)
        return Vapi::UserMessage.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::SystemMessage.validate_raw(obj: struct)
        return Vapi::SystemMessage.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::BotMessage.validate_raw(obj: struct)
        return Vapi::BotMessage.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ToolCallMessage.validate_raw(obj: struct)
        return Vapi::ToolCallMessage.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::ToolCallResultMessage.validate_raw(obj: struct)
        return Vapi::ToolCallResultMessage.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::UserMessage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::SystemMessage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::BotMessage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ToolCallMessage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::ToolCallResultMessage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
