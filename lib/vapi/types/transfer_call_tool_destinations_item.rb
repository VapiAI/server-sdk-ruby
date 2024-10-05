# frozen_string_literal: true

require "json"
require_relative "transfer_destination_assistant"
require_relative "transfer_destination_step"
require_relative "transfer_destination_number"
require_relative "transfer_destination_sip"

module Vapi
  class TransferCallToolDestinationsItem
    # Deserialize a JSON object to an instance of TransferCallToolDestinationsItem
    #
    # @param json_object [String]
    # @return [Vapi::TransferCallToolDestinationsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::TransferDestinationAssistant.validate_raw(obj: struct)
        return Vapi::TransferDestinationAssistant.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::TransferDestinationStep.validate_raw(obj: struct)
        return Vapi::TransferDestinationStep.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::TransferDestinationNumber.validate_raw(obj: struct)
        return Vapi::TransferDestinationNumber.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::TransferDestinationSip.validate_raw(obj: struct)
        return Vapi::TransferDestinationSip.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::TransferDestinationAssistant.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::TransferDestinationStep.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::TransferDestinationNumber.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::TransferDestinationSip.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
