# frozen_string_literal: true
require_relative "client_inbound_message_control_control"
require "ostruct"
require "json"

module Vapi
  class ClientInboundMessageControl
  # @return [Vapi::ClientInboundMessageControlControl] This is the control action
    attr_reader :control
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param control [Vapi::ClientInboundMessageControlControl] This is the control action
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientInboundMessageControl]
    def initialize(control:, additional_properties: nil)
      @control = control
      @additional_properties = additional_properties
      @_field_set = { "control": control }
    end
# Deserialize a JSON object to an instance of ClientInboundMessageControl
    #
    # @param json_object [String] 
    # @return [Vapi::ClientInboundMessageControl]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      control = parsed_json["control"]
      new(control: control, additional_properties: struct)
    end
# Serialize an instance of ClientInboundMessageControl to a JSON object
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
      obj.control.is_a?(Vapi::ClientInboundMessageControlControl) != false || raise("Passed value for field obj.control is not the expected type, validation failed.")
    end
  end
end