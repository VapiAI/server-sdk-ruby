# frozen_string_literal: true

require "json"
require_relative "transfer_destination_number"
require_relative "transfer_destination_sip"

module Vapi
  # This is the fallback destination an inbound call will be transferred to if:
  #  1. `assistantId` is not set
  #  2. `squadId` is not set
  #  3. and, `assistant-request` message to the `serverUrl` fails
  #  If this is not set and above conditions are met, the inbound call is hung up
  #  with an error message.
  class TwilioPhoneNumberFallbackDestination
    # Deserialize a JSON object to an instance of TwilioPhoneNumberFallbackDestination
    #
    # @param json_object [String]
    # @return [Vapi::TwilioPhoneNumberFallbackDestination]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
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
