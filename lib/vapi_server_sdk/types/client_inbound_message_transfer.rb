# frozen_string_literal: true
require_relative "client_inbound_message_transfer_destination"
require "ostruct"
require "json"

module Vapi
  class ClientInboundMessageTransfer
  # @return [Vapi::ClientInboundMessageTransferDestination] This is the destination to transfer the call to.
    attr_reader :destination
  # @return [String] This is the content to say.
    attr_reader :content
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param destination [Vapi::ClientInboundMessageTransferDestination] This is the destination to transfer the call to.
    # @param content [String] This is the content to say.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientInboundMessageTransfer]
    def initialize(destination: OMIT, content: OMIT, additional_properties: nil)
      @destination = destination if destination != OMIT
      @content = content if content != OMIT
      @additional_properties = additional_properties
      @_field_set = { "destination": destination, "content": content }.reject do | _k, v |
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
      unless parsed_json["destination"].nil?
        destination = parsed_json["destination"].to_json
        destination = Vapi::ClientInboundMessageTransferDestination.from_json(json_object: destination)
      else
        destination = nil
      end
      content = parsed_json["content"]
      new(
        destination: destination,
        content: content,
        additional_properties: struct
      )
    end
# Serialize an instance of ClientInboundMessageTransfer to a JSON object
    #
    # @return [String]
    def to_json
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
      obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
    end
  end
end