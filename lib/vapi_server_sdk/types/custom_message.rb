# frozen_string_literal: true

require_relative "text_content"
require_relative "custom_message_type"
require "ostruct"
require "json"

module Vapi
  class CustomMessage
    # @return [Array<Vapi::TextContent>] This is an alternative to the `content` property. It allows to specify variants
    #  of the same content, one per language.
    #  Usage:
    #  - If your assistants are multilingual, you can provide content for each
    #  language.
    #  - If you don't provide content for a language, the first item in the array will
    #  be automatically translated to the active language at that moment.
    #  This will override the `content` property.
    attr_reader :contents
    # @return [Vapi::CustomMessageType] This is a custom message.
    attr_reader :type
    # @return [String] This is the content that the assistant will say when this message is triggered.
    attr_reader :content
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
    # @param type [Vapi::CustomMessageType] This is a custom message.
    # @param content [String] This is the content that the assistant will say when this message is triggered.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CustomMessage]
    def initialize(type:, contents: OMIT, content: OMIT, additional_properties: nil)
      @contents = contents if contents != OMIT
      @type = type
      @content = content if content != OMIT
      @additional_properties = additional_properties
      @_field_set = { "contents": contents, "type": type, "content": content }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CustomMessage
    #
    # @param json_object [String]
    # @return [Vapi::CustomMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      contents = parsed_json["contents"]&.map do |item|
        item = item.to_json
        Vapi::TextContent.from_json(json_object: item)
      end
      type = parsed_json["type"]
      content = parsed_json["content"]
      new(
        contents: contents,
        type: type,
        content: content,
        additional_properties: struct
      )
    end

    # Serialize an instance of CustomMessage to a JSON object
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
      obj.contents&.is_a?(Array) != false || raise("Passed value for field obj.contents is not the expected type, validation failed.")
      obj.type.is_a?(Vapi::CustomMessageType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
    end
  end
end
