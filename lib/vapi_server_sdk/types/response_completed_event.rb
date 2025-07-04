# frozen_string_literal: true

require_relative "response_object"
require "ostruct"
require "json"

module Vapi
  class ResponseCompletedEvent
    # @return [Vapi::ResponseObject] The completed response
    attr_reader :response
    # @return [String] Event type
    attr_reader :type
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param response [Vapi::ResponseObject] The completed response
    # @param type [String] Event type
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ResponseCompletedEvent]
    def initialize(response:, type:, additional_properties: nil)
      @response = response
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "response": response, "type": type }
    end

    # Deserialize a JSON object to an instance of ResponseCompletedEvent
    #
    # @param json_object [String]
    # @return [Vapi::ResponseCompletedEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["response"].nil?
        response = nil
      else
        response = parsed_json["response"].to_json
        response = Vapi::ResponseObject.from_json(json_object: response)
      end
      type = parsed_json["type"]
      new(
        response: response,
        type: type,
        additional_properties: struct
      )
    end

    # Serialize an instance of ResponseCompletedEvent to a JSON object
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
      Vapi::ResponseObject.validate_raw(obj: obj.response)
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end
