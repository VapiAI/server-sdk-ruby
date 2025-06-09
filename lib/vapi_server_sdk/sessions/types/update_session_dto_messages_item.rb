# frozen_string_literal: true
require "json"
require_relative "../../types/system_message"
require_relative "../../types/user_message"
require_relative "../../types/assistant_message"
require_relative "../../types/tool_message"
require_relative "../../types/developer_message"

module Vapi
  module Sessions
    class UpdateSessionDtoMessagesItem


# Deserialize a JSON object to an instance of UpdateSessionDtoMessagesItem
      #
      # @param json_object [String] 
      # @return [Vapi::Sessions::UpdateSessionDtoMessagesItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Vapi::SystemMessage.validate_raw(obj: struct)
          unless struct.nil?
  return Vapi::SystemMessage.from_json(json_object: struct)
else
  return nil
end
        rescue StandardError
          # noop
        end
        begin
          Vapi::UserMessage.validate_raw(obj: struct)
          unless struct.nil?
  return Vapi::UserMessage.from_json(json_object: struct)
else
  return nil
end
        rescue StandardError
          # noop
        end
        begin
          Vapi::AssistantMessage.validate_raw(obj: struct)
          unless struct.nil?
  return Vapi::AssistantMessage.from_json(json_object: struct)
else
  return nil
end
        rescue StandardError
          # noop
        end
        begin
          Vapi::ToolMessage.validate_raw(obj: struct)
          unless struct.nil?
  return Vapi::ToolMessage.from_json(json_object: struct)
else
  return nil
end
        rescue StandardError
          # noop
        end
        begin
          Vapi::DeveloperMessage.validate_raw(obj: struct)
          unless struct.nil?
  return Vapi::DeveloperMessage.from_json(json_object: struct)
else
  return nil
end
        rescue StandardError
          # noop
        end
 return struct
      end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Vapi::SystemMessage.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::UserMessage.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::AssistantMessage.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::ToolMessage.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::DeveloperMessage.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end