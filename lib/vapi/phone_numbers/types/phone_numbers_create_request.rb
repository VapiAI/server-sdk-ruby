# frozen_string_literal: true

require "json"
require_relative "../../types/create_byo_phone_number_dto"
require_relative "../../types/create_twilio_phone_number_dto"
require_relative "../../types/create_vonage_phone_number_dto"
require_relative "../../types/create_vapi_phone_number_dto"

module Vapi
  class PhoneNumbers
    class PhoneNumbersCreateRequest
      # Deserialize a JSON object to an instance of PhoneNumbersCreateRequest
      #
      # @param json_object [String]
      # @return [Vapi::PhoneNumbers::PhoneNumbersCreateRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Vapi::CreateByoPhoneNumberDto.validate_raw(obj: struct)
          return Vapi::CreateByoPhoneNumberDto.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::CreateTwilioPhoneNumberDto.validate_raw(obj: struct)
          return Vapi::CreateTwilioPhoneNumberDto.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::CreateVonagePhoneNumberDto.validate_raw(obj: struct)
          return Vapi::CreateVonagePhoneNumberDto.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::CreateVapiPhoneNumberDto.validate_raw(obj: struct)
          return Vapi::CreateVapiPhoneNumberDto.from_json(json_object: struct) unless struct.nil?

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
          return Vapi::CreateByoPhoneNumberDto.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::CreateTwilioPhoneNumberDto.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::CreateVonagePhoneNumberDto.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::CreateVapiPhoneNumberDto.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
