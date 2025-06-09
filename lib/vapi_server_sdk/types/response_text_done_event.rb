# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class ResponseTextDoneEvent
  # @return [Float] Index of the content part
    attr_reader :content_index
  # @return [String] ID of the output item
    attr_reader :item_id
  # @return [Float] Index of the output item
    attr_reader :output_index
  # @return [String] Complete text content
    attr_reader :text
  # @return [String] Event type
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param content_index [Float] Index of the content part
    # @param item_id [String] ID of the output item
    # @param output_index [Float] Index of the output item
    # @param text [String] Complete text content
    # @param type [String] Event type
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ResponseTextDoneEvent]
    def initialize(content_index:, item_id:, output_index:, text:, type:, additional_properties: nil)
      @content_index = content_index
      @item_id = item_id
      @output_index = output_index
      @text = text
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "content_index": content_index, "item_id": item_id, "output_index": output_index, "text": text, "type": type }
    end
# Deserialize a JSON object to an instance of ResponseTextDoneEvent
    #
    # @param json_object [String] 
    # @return [Vapi::ResponseTextDoneEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      content_index = parsed_json["content_index"]
      item_id = parsed_json["item_id"]
      output_index = parsed_json["output_index"]
      text = parsed_json["text"]
      type = parsed_json["type"]
      new(
        content_index: content_index,
        item_id: item_id,
        output_index: output_index,
        text: text,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of ResponseTextDoneEvent to a JSON object
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
      obj.content_index.is_a?(Float) != false || raise("Passed value for field obj.content_index is not the expected type, validation failed.")
      obj.item_id.is_a?(String) != false || raise("Passed value for field obj.item_id is not the expected type, validation failed.")
      obj.output_index.is_a?(Float) != false || raise("Passed value for field obj.output_index is not the expected type, validation failed.")
      obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end