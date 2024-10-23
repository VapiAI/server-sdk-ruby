# frozen_string_literal: true

require "json"
require_relative "create_byo_phone_number_dto"
require_relative "create_twilio_phone_number_dto"
require_relative "create_vonage_phone_number_dto"
require_relative "create_vapi_phone_number_dto"

module Vapi
  # This is the phone number associated with the call.
  #  This matches one of the following:
  #  - `call.phoneNumber`,
  #  - `call.phoneNumberId`.
  class ServerMessageHangPhoneNumber
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::ServerMessageHangPhoneNumber]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of ServerMessageHangPhoneNumber
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageHangPhoneNumber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.provider
               when "byo-phone-number"
                 Vapi::CreateByoPhoneNumberDto.from_json(json_object: json_object)
               when "twilio"
                 Vapi::CreateTwilioPhoneNumberDto.from_json(json_object: json_object)
               when "vonage"
                 Vapi::CreateVonagePhoneNumberDto.from_json(json_object: json_object)
               when "vapi"
                 Vapi::CreateVapiPhoneNumberDto.from_json(json_object: json_object)
               else
                 Vapi::CreateByoPhoneNumberDto.from_json(json_object: json_object)
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
        Vapi::CreateByoPhoneNumberDto.validate_raw(obj: obj)
      when "twilio"
        Vapi::CreateTwilioPhoneNumberDto.validate_raw(obj: obj)
      when "vonage"
        Vapi::CreateVonagePhoneNumberDto.validate_raw(obj: obj)
      when "vapi"
        Vapi::CreateVapiPhoneNumberDto.validate_raw(obj: obj)
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

    # @param member [Vapi::CreateByoPhoneNumberDto]
    # @return [Vapi::ServerMessageHangPhoneNumber]
    def self.byo_phone_number(member:)
      new(member: member, discriminant: "byo-phone-number")
    end

    # @param member [Vapi::CreateTwilioPhoneNumberDto]
    # @return [Vapi::ServerMessageHangPhoneNumber]
    def self.twilio(member:)
      new(member: member, discriminant: "twilio")
    end

    # @param member [Vapi::CreateVonagePhoneNumberDto]
    # @return [Vapi::ServerMessageHangPhoneNumber]
    def self.vonage(member:)
      new(member: member, discriminant: "vonage")
    end

    # @param member [Vapi::CreateVapiPhoneNumberDto]
    # @return [Vapi::ServerMessageHangPhoneNumber]
    def self.vapi(member:)
      new(member: member, discriminant: "vapi")
    end
  end
end
