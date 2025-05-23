# frozen_string_literal: true

require_relative "variable_extraction_schema_type"
require "ostruct"
require "json"

module Vapi
  class VariableExtractionSchema
    # @return [Vapi::VariableExtractionSchemaType] This is the type of output you'd like.
    #  `string`, `number`, `boolean` are primitive types.
    attr_reader :type
    # @return [String] This is the title of the variable.
    #  It can only contain letters, numbers, and underscores.
    attr_reader :title
    # @return [String] This is the description to help the model understand what it needs to output.
    attr_reader :description
    # @return [Array<String>] This is the enum values to choose from. Only used if the type is `string`.
    attr_reader :enum
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vapi::VariableExtractionSchemaType] This is the type of output you'd like.
    #  `string`, `number`, `boolean` are primitive types.
    # @param title [String] This is the title of the variable.
    #  It can only contain letters, numbers, and underscores.
    # @param description [String] This is the description to help the model understand what it needs to output.
    # @param enum [Array<String>] This is the enum values to choose from. Only used if the type is `string`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VariableExtractionSchema]
    def initialize(type:, title:, description:, enum: OMIT, additional_properties: nil)
      @type = type
      @title = title
      @description = description
      @enum = enum if enum != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "title": title, "description": description, "enum": enum }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of VariableExtractionSchema
    #
    # @param json_object [String]
    # @return [Vapi::VariableExtractionSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      title = parsed_json["title"]
      description = parsed_json["description"]
      enum = parsed_json["enum"]
      new(
        type: type,
        title: title,
        description: description,
        enum: enum,
        additional_properties: struct
      )
    end

    # Serialize an instance of VariableExtractionSchema to a JSON object
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
      obj.type.is_a?(Vapi::VariableExtractionSchemaType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.enum&.is_a?(Array) != false || raise("Passed value for field obj.enum is not the expected type, validation failed.")
    end
  end
end
