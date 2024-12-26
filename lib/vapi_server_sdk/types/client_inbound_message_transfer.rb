# frozen_string_literal: true

require_relative "client_inbound_message_transfer_destination"
require "ostruct"
require "json"

module Vapi
  class ClientInboundMessageTransfer
    # @return [Vapi::ClientInboundMessageTransferDestination] This is the destination to transfer the call to.
    attr_reader :destination
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param destination [Vapi::ClientInboundMessageTransferDestination] This is the destination to transfer the call to.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientInboundMessageTransfer]
    def initialize(destination: OMIT, additional_properties: nil)
      @destination = destination if destination != OMIT
      @additional_properties = additional_properties
      @_field_set = { "destination": destination }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ClientInboundMessageTransfer
    #
    # @param json_object [String]
    # @return [Vapi::ClientInboundMessageTransfer]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["destination"].nil?
        destination = nil
      else
        destination = parsed_json["destination"].to_json
        destination = Vapi::ClientInboundMessageTransferDestination.from_json(json_object: destination)
      end
      new(destination: destination, additional_properties: struct)
    end

    # Serialize an instance of ClientInboundMessageTransfer to a JSON object
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
      obj.destination.nil? || Vapi::ClientInboundMessageTransferDestination.validate_raw(obj: obj.destination)
    end
  end
end
