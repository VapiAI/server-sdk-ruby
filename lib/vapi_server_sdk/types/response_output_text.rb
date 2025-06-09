# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class ResponseOutputText
  # @return [Array<Hash{String => Object}>] Annotations in the text output
    attr_reader :annotations
  # @return [String] The text output from the model
    attr_reader :text
  # @return [String] The type of the output text
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param annotations [Array<Hash{String => Object}>] Annotations in the text output
    # @param text [String] The text output from the model
    # @param type [String] The type of the output text
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ResponseOutputText]
    def initialize(annotations:, text:, type:, additional_properties: nil)
      @annotations = annotations
      @text = text
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "annotations": annotations, "text": text, "type": type }
    end
# Deserialize a JSON object to an instance of ResponseOutputText
    #
    # @param json_object [String] 
    # @return [Vapi::ResponseOutputText]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      annotations = parsed_json["annotations"]
      text = parsed_json["text"]
      type = parsed_json["type"]
      new(
        annotations: annotations,
        text: text,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of ResponseOutputText to a JSON object
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
      obj.annotations.is_a?(Array) != false || raise("Passed value for field obj.annotations is not the expected type, validation failed.")
      obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end