# frozen_string_literal: true

require_relative "condition"
require "ostruct"
require "json"

module Vapi
  class ToolMessageFailed
    # @return [String] This message is triggered when the tool call fails.
    #  This message is never triggered for async tool calls.
    #  If this message is not provided, the model will be requested to respond.
    #  If this message is provided, only this message will be spoken and the model will
    #  not be requested to come up with a response. It's an exclusive OR.
    attr_reader :type
    # @return [Boolean] This is an optional boolean that if true, the call will end after the message is
    #  spoken. Default is false.
    #  @default false
    attr_reader :end_call_after_spoken_enabled
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

    # @param type [String] This message is triggered when the tool call fails.
    #  This message is never triggered for async tool calls.
    #  If this message is not provided, the model will be requested to respond.
    #  If this message is provided, only this message will be spoken and the model will
    #  not be requested to come up with a response. It's an exclusive OR.
    # @param end_call_after_spoken_enabled [Boolean] This is an optional boolean that if true, the call will end after the message is
    #  spoken. Default is false.
    #  @default false
    # @param content [String] This is the content that the assistant says when this message is triggered.
    # @param conditions [Array<Vapi::Condition>] This is an optional array of conditions that the tool call arguments must meet
    #  in order for this message to be triggered.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolMessageFailed]
    def initialize(type:, content:, end_call_after_spoken_enabled: OMIT, conditions: OMIT, additional_properties: nil)
      @type = type
      @end_call_after_spoken_enabled = end_call_after_spoken_enabled if end_call_after_spoken_enabled != OMIT
      @content = content
      @conditions = conditions if conditions != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "type": type,
        "endCallAfterSpokenEnabled": end_call_after_spoken_enabled,
        "content": content,
        "conditions": conditions
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ToolMessageFailed
    #
    # @param json_object [String]
    # @return [Vapi::ToolMessageFailed]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      end_call_after_spoken_enabled = parsed_json["endCallAfterSpokenEnabled"]
      content = parsed_json["content"]
      conditions = parsed_json["conditions"]&.map do |item|
        item = item.to_json
        Vapi::Condition.from_json(json_object: item)
      end
      new(
        type: type,
        end_call_after_spoken_enabled: end_call_after_spoken_enabled,
        content: content,
        conditions: conditions,
        additional_properties: struct
      )
    end

    # Serialize an instance of ToolMessageFailed to a JSON object
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
      obj.end_call_after_spoken_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.end_call_after_spoken_enabled is not the expected type, validation failed.")
      obj.content.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.conditions&.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
    end
  end
end
