# frozen_string_literal: true

require_relative "response_error_event_type"
require "ostruct"
require "json"

module Vapi
  class ResponseErrorEvent
    # @return [Vapi::ResponseErrorEventType] Event type
    attr_reader :type
    # @return [String] Error code
    attr_reader :code
    # @return [String] Error message
    attr_reader :message
    # @return [String] Parameter that caused the error
    attr_reader :param
    # @return [Float] Sequence number of the event
    attr_reader :sequence_number
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vapi::ResponseErrorEventType] Event type
    # @param code [String] Error code
    # @param message [String] Error message
    # @param param [String] Parameter that caused the error
    # @param sequence_number [Float] Sequence number of the event
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ResponseErrorEvent]
    def initialize(type:, code:, message:, sequence_number:, param: OMIT, additional_properties: nil)
      @type = type
      @code = code
      @message = message
      @param = param if param != OMIT
      @sequence_number = sequence_number
      @additional_properties = additional_properties
      @_field_set = {
        "type": type,
        "code": code,
        "message": message,
        "param": param,
        "sequence_number": sequence_number
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ResponseErrorEvent
    #
    # @param json_object [String]
    # @return [Vapi::ResponseErrorEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      code = parsed_json["code"]
      message = parsed_json["message"]
      param = parsed_json["param"]
      sequence_number = parsed_json["sequence_number"]
      new(
        type: type,
        code: code,
        message: message,
        param: param,
        sequence_number: sequence_number,
        additional_properties: struct
      )
    end

    # Serialize an instance of ResponseErrorEvent to a JSON object
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
      obj.type.is_a?(Vapi::ResponseErrorEventType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.code.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.param&.is_a?(String) != false || raise("Passed value for field obj.param is not the expected type, validation failed.")
      obj.sequence_number.is_a?(Float) != false || raise("Passed value for field obj.sequence_number is not the expected type, validation failed.")
    end
  end
end
