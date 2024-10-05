# frozen_string_literal: true

require "json"
require_relative "../../types/byo_phone_number"
require_relative "../../types/twilio_phone_number"
require_relative "../../types/vonage_phone_number"
require_relative "../../types/vapi_phone_number"

module Vapi
  class PhoneNumbers
    class PhoneNumbersUpdateResponse
      # Deserialize a JSON object to an instance of PhoneNumbersUpdateResponse
      #
      # @param json_object [String]
      # @return [Vapi::PhoneNumbers::PhoneNumbersUpdateResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Vapi::ByoPhoneNumber.validate_raw(obj: struct)
          return Vapi::ByoPhoneNumber.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::TwilioPhoneNumber.validate_raw(obj: struct)
          return Vapi::TwilioPhoneNumber.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::VonagePhoneNumber.validate_raw(obj: struct)
          return Vapi::VonagePhoneNumber.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::VapiPhoneNumber.validate_raw(obj: struct)
          return Vapi::VapiPhoneNumber.from_json(json_object: struct) unless struct.nil?

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
          return Vapi::ByoPhoneNumber.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::TwilioPhoneNumber.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::VonagePhoneNumber.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::VapiPhoneNumber.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
