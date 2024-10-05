# frozen_string_literal: true

require_relative "condition"
require "ostruct"
require "json"

module Vapi
  class ToolMessageDelayed
    # @return [String] This message is triggered when the tool call is delayed.
    #  There are the two things that can trigger this message:
    #  1. The user talks with the assistant while your server is processing the
    #  request. Default is "Sorry, a few more seconds."
    #  2. The server doesn't respond within `timingMilliseconds`.
    #  This message is never triggered for async tool calls.
    attr_reader :type
    # @return [Float] The number of milliseconds to wait for the server response before saying this
    #  message.
    attr_reader :timing_milliseconds
    # @return [String] This is the content that the assistant says when this message is triggered.
    attr_reader :content
    # @return [Array<Vapi::Condition>] This is an optional array of conditions that the tool call arguments must meet
    #  in order for this message to be triggered.
    attr_reader :conditions
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This message is triggered when the tool call is delayed.
    #  There are the two things that can trigger this message:
    #  1. The user talks with the assistant while your server is processing the
    #  request. Default is "Sorry, a few more seconds."
    #  2. The server doesn't respond within `timingMilliseconds`.
    #  This message is never triggered for async tool calls.
    # @param timing_milliseconds [Float] The number of milliseconds to wait for the server response before saying this
    #  message.
    # @param content [String] This is the content that the assistant says when this message is triggered.
    # @param conditions [Array<Vapi::Condition>] This is an optional array of conditions that the tool call arguments must meet
    #  in order for this message to be triggered.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolMessageDelayed]
    def initialize(type:, content:, timing_milliseconds: OMIT, conditions: OMIT, additional_properties: nil)
      @type = type
      @timing_milliseconds = timing_milliseconds if timing_milliseconds != OMIT
      @content = content
      @conditions = conditions if conditions != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "type": type,
        "timingMilliseconds": timing_milliseconds,
        "content": content,
        "conditions": conditions
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ToolMessageDelayed
    #
    # @param json_object [String]
    # @return [Vapi::ToolMessageDelayed]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      timing_milliseconds = parsed_json["timingMilliseconds"]
      content = parsed_json["content"]
      conditions = parsed_json["conditions"]&.map do |item|
        item = item.to_json
        Vapi::Condition.from_json(json_object: item)
      end
      new(
        type: type,
        timing_milliseconds: timing_milliseconds,
        content: content,
        conditions: conditions,
        additional_properties: struct
      )
    end

    # Serialize an instance of ToolMessageDelayed to a JSON object
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
      obj.timing_milliseconds&.is_a?(Float) != false || raise("Passed value for field obj.timing_milliseconds is not the expected type, validation failed.")
      obj.content.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.conditions&.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
    end
  end
end
