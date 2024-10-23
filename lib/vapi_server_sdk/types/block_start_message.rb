# frozen_string_literal: true

require_relative "block_start_message_conditions_item"
require "ostruct"
require "json"

module Vapi
  class BlockStartMessage
    # @return [Array<Vapi::BlockStartMessageConditionsItem>] This is an optional array of conditions that must be met for this message to be
    #  triggered.
    attr_reader :conditions
    # @return [String] This is the content that the assistant will say when this message is triggered.
    attr_reader :content
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param conditions [Array<Vapi::BlockStartMessageConditionsItem>] This is an optional array of conditions that must be met for this message to be
    #  triggered.
    # @param content [String] This is the content that the assistant will say when this message is triggered.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::BlockStartMessage]
    def initialize(content:, conditions: OMIT, additional_properties: nil)
      @conditions = conditions if conditions != OMIT
      @content = content
      @additional_properties = additional_properties
      @_field_set = { "conditions": conditions, "content": content }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of BlockStartMessage
    #
    # @param json_object [String]
    # @return [Vapi::BlockStartMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      conditions = parsed_json["conditions"]&.map do |item|
        item = item.to_json
        Vapi::BlockStartMessageConditionsItem.from_json(json_object: item)
      end
      content = parsed_json["content"]
      new(
        conditions: conditions,
        content: content,
        additional_properties: struct
      )
    end

    # Serialize an instance of BlockStartMessage to a JSON object
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
      obj.conditions&.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
      obj.content.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
    end
  end
end
