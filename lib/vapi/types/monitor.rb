# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class Monitor
    # @return [String] This is the URL where the assistant's calls can be listened to in real-time. To
    #  enable, set `assistant.monitorPlan.listenEnabled` to `true`.
    attr_reader :listen_url
    # @return [String] This is the URL where the assistant's calls can be controlled in real-time. To
    #  enable, set `assistant.monitorPlan.controlEnabled` to `true`.
    attr_reader :control_url
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param listen_url [String] This is the URL where the assistant's calls can be listened to in real-time. To
    #  enable, set `assistant.monitorPlan.listenEnabled` to `true`.
    # @param control_url [String] This is the URL where the assistant's calls can be controlled in real-time. To
    #  enable, set `assistant.monitorPlan.controlEnabled` to `true`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Monitor]
    def initialize(listen_url: OMIT, control_url: OMIT, additional_properties: nil)
      @listen_url = listen_url if listen_url != OMIT
      @control_url = control_url if control_url != OMIT
      @additional_properties = additional_properties
      @_field_set = { "listenUrl": listen_url, "controlUrl": control_url }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Monitor
    #
    # @param json_object [String]
    # @return [Vapi::Monitor]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      listen_url = parsed_json["listenUrl"]
      control_url = parsed_json["controlUrl"]
      new(
        listen_url: listen_url,
        control_url: control_url,
        additional_properties: struct
      )
    end

    # Serialize an instance of Monitor to a JSON object
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
      obj.listen_url&.is_a?(String) != false || raise("Passed value for field obj.listen_url is not the expected type, validation failed.")
      obj.control_url&.is_a?(String) != false || raise("Passed value for field obj.control_url is not the expected type, validation failed.")
    end
  end
end
