# frozen_string_literal: true

require_relative "server"
require "ostruct"
require "json"

module Vapi
  class HandoffDestinationDynamic
    # @return [Vapi::Server] This is where Vapi will send the handoff-destination-request webhook in a
    #  dynamic handoff.
    #  The order of precedence is:
    #  1. tool.server.url
    #  2. assistant.server.url
    #  3. phoneNumber.server.url
    #  4. org.server.url
    attr_reader :server
    # @return [String] This is the description of the destination, used by the AI to choose when and
    #  how to transfer the call.
    attr_reader :description
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param server [Vapi::Server] This is where Vapi will send the handoff-destination-request webhook in a
    #  dynamic handoff.
    #  The order of precedence is:
    #  1. tool.server.url
    #  2. assistant.server.url
    #  3. phoneNumber.server.url
    #  4. org.server.url
    # @param description [String] This is the description of the destination, used by the AI to choose when and
    #  how to transfer the call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::HandoffDestinationDynamic]
    def initialize(server: OMIT, description: OMIT, additional_properties: nil)
      @server = server if server != OMIT
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = { "server": server, "description": description }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of HandoffDestinationDynamic
    #
    # @param json_object [String]
    # @return [Vapi::HandoffDestinationDynamic]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["server"].nil?
        server = nil
      else
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      end
      description = parsed_json["description"]
      new(
        server: server,
        description: description,
        additional_properties: struct
      )
    end

    # Serialize an instance of HandoffDestinationDynamic to a JSON object
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
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end
