# frozen_string_literal: true
require "json"
require_relative "custom_message"

module Vapi
# This is spoken to the customer before connecting them to the destination.
#  Usage:
#  - If this is not provided and transfer tool messages is not provided, default is
#  "Transferring the call now".
#  - If set to "", nothing is spoken. This is useful when you want to silently
#  transfer. This is especially useful when transferring between assistants in a
#  squad. In this scenario, you likely also want to set
#  `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message`
#  for the destination assistant.
#  This accepts a string or a ToolMessageStart class. Latter is useful if you want
#  to specify multiple messages for different languages through the `contents`
#  field.
  class TransferDestinationSipMessage


# Deserialize a JSON object to an instance of TransferDestinationSipMessage
    #
    # @param json_object [String] 
    # @return [Vapi::TransferDestinationSipMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        struct.is_a?(String) != false || raise("Passed value for field struct is not the expected type, validation failed.")
        unless struct.nil?
  return struct
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vapi::CustomMessage.validate_raw(obj: struct)
        unless struct.nil?
  return Vapi::CustomMessage.from_json(json_object: struct)
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
        return obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CustomMessage.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end