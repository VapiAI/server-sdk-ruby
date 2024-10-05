# frozen_string_literal: true

require_relative "client_inbound_message_control_control"
require "ostruct"
require "json"

module Vapi
  class ClientInboundMessageControl
    # @return [String] This is the type of the message. Send "control" message to control the
    #  assistant. `control` options are:
    #  - "mute-assistant" - mute the assistant
    #  - "unmute-assistant" - unmute the assistant
    #  - "say-first-message" - say the first message (this is used when video recording
    #  is enabled and the conversation is only started once the client side kicks off
    #  the recording)
    attr_reader :type
    # @return [Vapi::ClientInboundMessageControlControl] This is the control action
    attr_reader :control
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This is the type of the message. Send "control" message to control the
    #  assistant. `control` options are:
    #  - "mute-assistant" - mute the assistant
    #  - "unmute-assistant" - unmute the assistant
    #  - "say-first-message" - say the first message (this is used when video recording
    #  is enabled and the conversation is only started once the client side kicks off
    #  the recording)
    # @param control [Vapi::ClientInboundMessageControlControl] This is the control action
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientInboundMessageControl]
    def initialize(type:, control:, additional_properties: nil)
      @type = type
      @control = control
      @additional_properties = additional_properties
      @_field_set = { "type": type, "control": control }
    end

    # Deserialize a JSON object to an instance of ClientInboundMessageControl
    #
    # @param json_object [String]
    # @return [Vapi::ClientInboundMessageControl]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      control = parsed_json["control"]
      new(
        type: type,
        control: control,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientInboundMessageControl to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.control.is_a?(Vapi::ClientInboundMessageControlControl) != false || raise("Passed value for field obj.control is not the expected type, validation failed.")
    end
  end
end
