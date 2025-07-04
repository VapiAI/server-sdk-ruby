# frozen_string_literal: true

require_relative "transfer_phone_number_hook_action_destination"
require "ostruct"
require "json"

module Vapi
  class TransferPhoneNumberHookAction
    # @return [Vapi::TransferPhoneNumberHookActionDestination] This is the destination details for the transfer - can be a phone number or SIP
    #  URI
    attr_reader :destination
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param destination [Vapi::TransferPhoneNumberHookActionDestination] This is the destination details for the transfer - can be a phone number or SIP
    #  URI
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TransferPhoneNumberHookAction]
    def initialize(destination: OMIT, additional_properties: nil)
      @destination = destination if destination != OMIT
      @additional_properties = additional_properties
      @_field_set = { "destination": destination }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TransferPhoneNumberHookAction
    #
    # @param json_object [String]
    # @return [Vapi::TransferPhoneNumberHookAction]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["destination"].nil?
        destination = nil
      else
        destination = parsed_json["destination"].to_json
        destination = Vapi::TransferPhoneNumberHookActionDestination.from_json(json_object: destination)
      end
      new(destination: destination, additional_properties: struct)
    end

    # Serialize an instance of TransferPhoneNumberHookAction to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.destination.nil? || Vapi::TransferPhoneNumberHookActionDestination.validate_raw(obj: obj.destination)
    end
  end
end
