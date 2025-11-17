# frozen_string_literal: true

require "json"
require_relative "../../types/byo_phone_number"
require_relative "../../types/twilio_phone_number"
require_relative "../../types/vonage_phone_number"
require_relative "../../types/vapi_phone_number"
require_relative "../../types/telnyx_phone_number"

module Vapi
  class PhoneNumbers
    class GetPhoneNumbersResponse
      # @return [Object]
      attr_reader :member
      # @return [String]
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object]
      # @param discriminant [String]
      # @return [Vapi::PhoneNumbers::GetPhoneNumbersResponse]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of GetPhoneNumbersResponse
      #
      # @param json_object [String]
      # @return [Vapi::PhoneNumbers::GetPhoneNumbersResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.provider
                 when "byo-phone-number"
                   Vapi::ByoPhoneNumber.from_json(json_object: json_object)
                 when "twilio"
                   Vapi::TwilioPhoneNumber.from_json(json_object: json_object)
                 when "vonage"
                   Vapi::VonagePhoneNumber.from_json(json_object: json_object)
                 when "vapi"
                   Vapi::VapiPhoneNumber.from_json(json_object: json_object)
                 when "telnyx"
                   Vapi::TelnyxPhoneNumber.from_json(json_object: json_object)
                 else
                   Vapi::ByoPhoneNumber.from_json(json_object: json_object)
                 end
        new(member: member, discriminant: struct.provider)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [String]
      def to_json(*_args)
        case @discriminant
        when "byo-phone-number"
          { **@member.to_json, provider: @discriminant }.to_json
        when "twilio"
          { **@member.to_json, provider: @discriminant }.to_json
        when "vonage"
          { **@member.to_json, provider: @discriminant }.to_json
        when "vapi"
          { **@member.to_json, provider: @discriminant }.to_json
        when "telnyx"
          { **@member.to_json, provider: @discriminant }.to_json
        else
          { "provider": @discriminant, value: @member }.to_json
        end
        @member.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        case obj.provider
        when "byo-phone-number"
          Vapi::ByoPhoneNumber.validate_raw(obj: obj)
        when "twilio"
          Vapi::TwilioPhoneNumber.validate_raw(obj: obj)
        when "vonage"
          Vapi::VonagePhoneNumber.validate_raw(obj: obj)
        when "vapi"
          Vapi::VapiPhoneNumber.validate_raw(obj: obj)
        when "telnyx"
          Vapi::TelnyxPhoneNumber.validate_raw(obj: obj)
        else
          raise("Passed value matched no type within the union, validation failed.")
        end
      end

      # For Union Types, is_a? functionality is delegated to the wrapped member.
      #
      # @param obj [Object]
      # @return [Boolean]
      def is_a?(obj)
        @member.is_a?(obj)
      end

      # @param member [Vapi::ByoPhoneNumber]
      # @return [Vapi::PhoneNumbers::GetPhoneNumbersResponse]
      def self.byo_phone_number(member:)
        new(member: member, discriminant: "byo-phone-number")
      end

      # @param member [Vapi::TwilioPhoneNumber]
      # @return [Vapi::PhoneNumbers::GetPhoneNumbersResponse]
      def self.twilio(member:)
        new(member: member, discriminant: "twilio")
      end

      # @param member [Vapi::VonagePhoneNumber]
      # @return [Vapi::PhoneNumbers::GetPhoneNumbersResponse]
      def self.vonage(member:)
        new(member: member, discriminant: "vonage")
      end

      # @param member [Vapi::VapiPhoneNumber]
      # @return [Vapi::PhoneNumbers::GetPhoneNumbersResponse]
      def self.vapi(member:)
        new(member: member, discriminant: "vapi")
      end

      # @param member [Vapi::TelnyxPhoneNumber]
      # @return [Vapi::PhoneNumbers::GetPhoneNumbersResponse]
      def self.telnyx(member:)
        new(member: member, discriminant: "telnyx")
      end
    end
  end
end
