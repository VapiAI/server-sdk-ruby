# frozen_string_literal: true

require "json"
require_relative "block_start_message"
require_relative "block_complete_message"

module Vapi
  class ConversationBlockMessagesItem
    # Deserialize a JSON object to an instance of ConversationBlockMessagesItem
    #
    # @param json_object [String]
    # @return [Vapi::ConversationBlockMessagesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::BlockStartMessage.validate_raw(obj: struct)
        return Vapi::BlockStartMessage.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::BlockCompleteMessage.validate_raw(obj: struct)
        return Vapi::BlockCompleteMessage.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::BlockStartMessage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::BlockCompleteMessage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
