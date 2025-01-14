# frozen_string_literal: true

require "json"
require_relative "custom_message"

module Vapi
  # This is the message the assistant will deliver to the destination party before
  #  connecting the customer.
  #  Usage:
  #  - Used only when `mode` is `blind-transfer-add-summary-to-sip-header`,
  #  `warm-transfer-say-message` or
  #  `warm-transfer-wait-for-operator-to-speak-first-and-then-say-message`.
  class TransferPlanMessage
    # Deserialize a JSON object to an instance of TransferPlanMessage
    #
    # @param json_object [String]
    # @return [Vapi::TransferPlanMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        struct.is_a?(String) != false || raise("Passed value for field struct is not the expected type, validation failed.")
        return struct unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::CustomMessage.validate_raw(obj: struct)
        return Vapi::CustomMessage.from_json(json_object: struct) unless struct.nil?

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
