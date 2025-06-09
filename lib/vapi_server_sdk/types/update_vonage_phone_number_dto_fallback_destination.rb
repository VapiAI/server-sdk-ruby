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
  class UpdateVonagePhoneNumberDtoFallbackDestination
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vapi::UpdateVonagePhoneNumberDtoFallbackDestination]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of
#  UpdateVonagePhoneNumberDtoFallbackDestination
    #
    # @param json_object [String] 
    # @return [Vapi::UpdateVonagePhoneNumberDtoFallbackDestination]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "number"
        member = Vapi::TransferDestinationNumber.from_json(json_object: json_object)
      when "sip"
        member = Vapi::TransferDestinationSip.from_json(json_object: json_object)
      else
        member = Vapi::TransferDestinationNumber.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "number"
        { **@member.to_json, type: @discriminant }.to_json
      when "sip"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
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
      case obj.type
      when "number"
        Vapi::TransferDestinationNumber.validate_raw(obj: obj)
      when "sip"
        Vapi::TransferDestinationSip.validate_raw(obj: obj)
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
    # @param member [Vapi::TransferDestinationNumber] 
    # @return [Vapi::UpdateVonagePhoneNumberDtoFallbackDestination]
    def self.number(member:)
      new(member: member, discriminant: "number")
    end
    # @param member [Vapi::TransferDestinationSip] 
    # @return [Vapi::UpdateVonagePhoneNumberDtoFallbackDestination]
    def self.sip(member:)
      new(member: member, discriminant: "sip")
    end
  end
end