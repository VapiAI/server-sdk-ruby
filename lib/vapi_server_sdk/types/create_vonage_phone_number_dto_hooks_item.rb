# frozen_string_literal: true

require "json"
require_relative "phone_number_hook_call_ringing"
require_relative "phone_number_hook_call_ending"

module Vapi
  class CreateVonagePhoneNumberDtoHooksItem
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::CreateVonagePhoneNumberDtoHooksItem]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of CreateVonagePhoneNumberDtoHooksItem
    #
    # @param json_object [String]
    # @return [Vapi::CreateVonagePhoneNumberDtoHooksItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.on
               when "call.ringing"
                 Vapi::PhoneNumberHookCallRinging.from_json(json_object: json_object)
               when "call.ending"
                 Vapi::PhoneNumberHookCallEnding.from_json(json_object: json_object)
               else
                 Vapi::PhoneNumberHookCallRinging.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.on)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "call.ringing"
        { **@member.to_json, on: @discriminant }.to_json
      when "call.ending"
        { **@member.to_json, on: @discriminant }.to_json
      else
        { "on": @discriminant, value: @member }.to_json
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
      case obj.on
      when "call.ringing"
        Vapi::PhoneNumberHookCallRinging.validate_raw(obj: obj)
      when "call.ending"
        Vapi::PhoneNumberHookCallEnding.validate_raw(obj: obj)
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

    # @param member [Vapi::PhoneNumberHookCallRinging]
    # @return [Vapi::CreateVonagePhoneNumberDtoHooksItem]
    def self.call_ringing(member:)
      new(member: member, discriminant: "call.ringing")
    end

    # @param member [Vapi::PhoneNumberHookCallEnding]
    # @return [Vapi::CreateVonagePhoneNumberDtoHooksItem]
    def self.call_ending(member:)
      new(member: member, discriminant: "call.ending")
    end
  end
end
