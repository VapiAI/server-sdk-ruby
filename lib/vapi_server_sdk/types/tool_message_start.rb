# frozen_string_literal: true
require_relative "text_content"
require_relative "condition"
require "ostruct"
require "json"

module Vapi
  class ToolMessageStart
  # @return [Array<Vapi::TextContent>] This is an alternative to the `content` property. It allows to specify variants
#  of the same content, one per language.
#  Usage:
#  - If your assistants are multilingual, you can provide content for each
#  language.
#  - If you don't provide content for a language, the first item in the array will
#  be automatically translated to the active language at that moment.
#  This will override the `content` property.
    attr_reader :contents
  # @return [Boolean] This is an optional boolean that if true, the tool call will only trigger after
#  the message is spoken. Default is false.
#  @default false
    attr_reader :blocking
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

    # @param contents [Array<Vapi::TextContent>] This is an alternative to the `content` property. It allows to specify variants
#  of the same content, one per language.
#  Usage:
#  - If your assistants are multilingual, you can provide content for each
#  language.
#  - If you don't provide content for a language, the first item in the array will
#  be automatically translated to the active language at that moment.
#  This will override the `content` property.
    # @param blocking [Boolean] This is an optional boolean that if true, the tool call will only trigger after
#  the message is spoken. Default is false.
#  @default false
    # @param content [String] This is the content that the assistant says when this message is triggered.
    # @param conditions [Array<Vapi::Condition>] This is an optional array of conditions that the tool call arguments must meet
#  in order for this message to be triggered.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolMessageStart]
    def initialize(contents: OMIT, blocking: OMIT, content: OMIT, conditions: OMIT, additional_properties: nil)
      @contents = contents if contents != OMIT
      @blocking = blocking if blocking != OMIT
      @content = content if content != OMIT
      @conditions = conditions if conditions != OMIT
      @additional_properties = additional_properties
      @_field_set = { "contents": contents, "blocking": blocking, "content": content, "conditions": conditions }.reject do | _k, v |
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
      contents = parsed_json["contents"]&.map do | item |
  item = item.to_json
  Vapi::TextContent.from_json(json_object: item)
end
      blocking = parsed_json["blocking"]
      content = parsed_json["content"]
      conditions = parsed_json["conditions"]&.map do | item |
  item = item.to_json
  Vapi::Condition.from_json(json_object: item)
end
      new(
        contents: contents,
        blocking: blocking,
        content: content,
        conditions: conditions,
        additional_properties: struct
      )
    end
# Serialize an instance of ToolMessageStart to a JSON object
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
      obj.contents&.is_a?(Array) != false || raise("Passed value for field obj.contents is not the expected type, validation failed.")
      obj.blocking&.is_a?(Boolean) != false || raise("Passed value for field obj.blocking is not the expected type, validation failed.")
      obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.conditions&.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
    end
  end
end