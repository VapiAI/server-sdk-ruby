# frozen_string_literal: true
require_relative "server_message_response_transfer_destination_request_destination"
require "ostruct"
require "json"

module Vapi
  class ServerMessageResponseTransferDestinationRequest
  # @return [Vapi::ServerMessageResponseTransferDestinationRequestDestination] This is the destination you'd like the call to be transferred to.
    attr_reader :destination
  # @return [String] This is the error message if the transfer should not be made.
    attr_reader :error
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param destination [Vapi::ServerMessageResponseTransferDestinationRequestDestination] This is the destination you'd like the call to be transferred to.
    # @param error [String] This is the error message if the transfer should not be made.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessageResponseTransferDestinationRequest]
    def initialize(destination: OMIT, error: OMIT, additional_properties: nil)
      @destination = destination if destination != OMIT
      @error = error if error != OMIT
      @additional_properties = additional_properties
      @_field_set = { "destination": destination, "error": error }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  ServerMessageResponseTransferDestinationRequest
    #
    # @param json_object [String] 
    # @return [Vapi::ServerMessageResponseTransferDestinationRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["destination"].nil?
        destination = parsed_json["destination"].to_json
        destination = Vapi::ServerMessageResponseTransferDestinationRequestDestination.from_json(json_object: destination)
      else
        destination = nil
      end
      error = parsed_json["error"]
      new(
        destination: destination,
        error: error,
        additional_properties: struct
      )
    end
# Serialize an instance of ServerMessageResponseTransferDestinationRequest to a
#  JSON object
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
      obj.destination.nil? || Vapi::ServerMessageResponseTransferDestinationRequestDestination.validate_raw(obj: obj.destination)
      obj.error&.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
    end
  end
end