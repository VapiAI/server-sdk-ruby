# frozen_string_literal: true

require_relative "json_schema_type"
require "ostruct"
require "json"

module Vapi
  class JsonSchema
    # @return [Vapi::JsonSchemaType] This is the type of output you'd like.
    #  `string`, `number`, `integer`, `boolean` are the primitive types and should be
    #  obvious.
    #  `array` and `object` are more interesting and quite powerful. They allow you to
    #  define nested structures.
    #  For `array`, you can define the schema of the items in the array using the
    #  `items` property.
    #  For `object`, you can define the properties of the object using the `properties`
    #  property.
    attr_reader :type
    # @return [Hash{String => Object}] This is required if the type is "array". This is the schema of the items in the
    #  array.
    #  This is of type JsonSchema. However, Swagger doesn't support circular
    #  references.
    attr_reader :items
    # @return [Hash{String => Object}] This is required if the type is "object". This specifies the properties of the
    #  object.
    #  This is a map of string to JsonSchema. However, Swagger doesn't support circular
    #  references.
    attr_reader :properties
    # @return [String] This is the description to help the model understand what it needs to output.
    attr_reader :description
    # @return [Array<String>] This is a list of properties that are required.
    #  This only makes sense if the type is "object".
    attr_reader :required
    # @return [Array<String>] This array specifies the allowed values that can be used to restrict the output
    #  of the model.
    attr_reader :enum
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vapi::JsonSchemaType] This is the type of output you'd like.
    #  `string`, `number`, `integer`, `boolean` are the primitive types and should be
    #  obvious.
    #  `array` and `object` are more interesting and quite powerful. They allow you to
    #  define nested structures.
    #  For `array`, you can define the schema of the items in the array using the
    #  `items` property.
    #  For `object`, you can define the properties of the object using the `properties`
    #  property.
    # @param items [Hash{String => Object}] This is required if the type is "array". This is the schema of the items in the
    #  array.
    #  This is of type JsonSchema. However, Swagger doesn't support circular
    #  references.
    # @param properties [Hash{String => Object}] This is required if the type is "object". This specifies the properties of the
    #  object.
    #  This is a map of string to JsonSchema. However, Swagger doesn't support circular
    #  references.
    # @param description [String] This is the description to help the model understand what it needs to output.
    # @param required [Array<String>] This is a list of properties that are required.
    #  This only makes sense if the type is "object".
    # @param enum [Array<String>] This array specifies the allowed values that can be used to restrict the output
    #  of the model.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::JsonSchema]
    def initialize(type:, items: OMIT, properties: OMIT, description: OMIT, required: OMIT, enum: OMIT,
                   additional_properties: nil)
      @type = type
      @items = items if items != OMIT
      @properties = properties if properties != OMIT
      @description = description if description != OMIT
      @required = required if required != OMIT
      @enum = enum if enum != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "type": type,
        "items": items,
        "properties": properties,
        "description": description,
        "required": required,
        "enum": enum
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of JsonSchema
    #
    # @param json_object [String]
    # @return [Vapi::JsonSchema]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      items = parsed_json["items"]
      properties = parsed_json["properties"]
      description = parsed_json["description"]
      required = parsed_json["required"]
      enum = parsed_json["enum"]
      new(
        type: type,
        items: items,
        properties: properties,
        description: description,
        required: required,
        enum: enum,
        additional_properties: struct
      )
    end

    # Serialize an instance of JsonSchema to a JSON object
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
      obj.type.is_a?(Vapi::JsonSchemaType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.items&.is_a?(Hash) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
      obj.properties&.is_a?(Hash) != false || raise("Passed value for field obj.properties is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.required&.is_a?(Array) != false || raise("Passed value for field obj.required is not the expected type, validation failed.")
      obj.enum&.is_a?(Array) != false || raise("Passed value for field obj.enum is not the expected type, validation failed.")
    end
  end
end
