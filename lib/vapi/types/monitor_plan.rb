# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class MonitorPlan
    # @return [Boolean] This determines whether the assistant's calls allow live listening. Defaults to
    #  true.
    #  Fetch `call.monitor.listenUrl` to get the live listening URL.
    #  @default true
    attr_reader :listen_enabled
    # @return [Boolean] This determines whether the assistant's calls allow live control. Defaults to
    #  true.
    #  Fetch `call.monitor.controlUrl` to get the live control URL.
    #  To use, send any control message via a POST request to
    #  `call.monitor.controlUrl`. Here are the types of controls supported:
    #  https://docs.vapi.ai/api-reference/messages/client-inbound-message
    #  @default true
    attr_reader :control_enabled
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param listen_enabled [Boolean] This determines whether the assistant's calls allow live listening. Defaults to
    #  true.
    #  Fetch `call.monitor.listenUrl` to get the live listening URL.
    #  @default true
    # @param control_enabled [Boolean] This determines whether the assistant's calls allow live control. Defaults to
    #  true.
    #  Fetch `call.monitor.controlUrl` to get the live control URL.
    #  To use, send any control message via a POST request to
    #  `call.monitor.controlUrl`. Here are the types of controls supported:
    #  https://docs.vapi.ai/api-reference/messages/client-inbound-message
    #  @default true
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::MonitorPlan]
    def initialize(listen_enabled: OMIT, control_enabled: OMIT, additional_properties: nil)
      @listen_enabled = listen_enabled if listen_enabled != OMIT
      @control_enabled = control_enabled if control_enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = { "listenEnabled": listen_enabled, "controlEnabled": control_enabled }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MonitorPlan
    #
    # @param json_object [String]
    # @return [Vapi::MonitorPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      listen_enabled = parsed_json["listenEnabled"]
      control_enabled = parsed_json["controlEnabled"]
      new(
        listen_enabled: listen_enabled,
        control_enabled: control_enabled,
        additional_properties: struct
      )
    end

    # Serialize an instance of MonitorPlan to a JSON object
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
      obj.listen_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.listen_enabled is not the expected type, validation failed.")
      obj.control_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.control_enabled is not the expected type, validation failed.")
    end
  end
end
