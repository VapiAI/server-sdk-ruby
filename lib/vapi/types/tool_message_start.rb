# frozen_string_literal: true

require_relative "condition"
require "ostruct"
require "json"

module Vapi
  class ToolMessageStart
    # @return [String] This message is triggered when the tool call starts.
    #  This message is never triggered for async tools.
    #  If this message is not provided, one of the default filler messages "Hold on a
    #  sec", "One moment", "Just a sec", "Give me a moment" or "This'll just take a
    #  sec" will be used.
    attr_reader :type
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

    # @param type [String] This message is triggered when the tool call starts.
    #  This message is never triggered for async tools.
    #  If this message is not provided, one of the default filler messages "Hold on a
    #  sec", "One moment", "Just a sec", "Give me a moment" or "This'll just take a
    #  sec" will be used.
    # @param content [String] This is the content that the assistant says when this message is triggered.
    # @param conditions [Array<Vapi::Condition>] This is an optional array of conditions that the tool call arguments must meet
    #  in order for this message to be triggered.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolMessageStart]
    def initialize(type:, content:, conditions: OMIT, additional_properties: nil)
      @type = type
      @content = content
      @conditions = conditions if conditions != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "content": content, "conditions": conditions }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ToolMessageStart
    #
    # @param json_object [String]
    # @return [Vapi::ToolMessageStart]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      content = parsed_json["content"]
      conditions = parsed_json["conditions"]&.map do |item|
        item = item.to_json
        Vapi::Condition.from_json(json_object: item)
      end
      new(
        type: type,
        content: content,
        conditions: conditions,
        additional_properties: struct
      )
    end

    # Serialize an instance of ToolMessageStart to a JSON object
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
      obj.content.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.conditions&.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
    end
  end
end
