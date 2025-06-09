# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class OpenAiFunctionParameters
  # @return [String] This must be set to 'object'. It instructs the model to return a JSON object
#  containing the function call properties.
    attr_reader :type
  # @return [Hash{String => Vapi::JsonSchema}] This provides a description of the properties required by the function.
#  JSON Schema can be used to specify expectations for each property.
#  Refer to [this doc](https://ajv.js.org/json-schema.html#json-data-type) for a
#  comprehensive guide on JSON Schema.
    attr_reader :properties
  # @return [Array<String>] This specifies the properties that are required by the function.
    attr_reader :required
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] This must be set to 'object'. It instructs the model to return a JSON object
#  containing the function call properties.
    # @param properties [Hash{String => Vapi::JsonSchema}] This provides a description of the properties required by the function.
#  JSON Schema can be used to specify expectations for each property.
#  Refer to [this doc](https://ajv.js.org/json-schema.html#json-data-type) for a
#  comprehensive guide on JSON Schema.
    # @param required [Array<String>] This specifies the properties that are required by the function.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::OpenAiFunctionParameters]
    def initialize(type:, properties:, required: OMIT, additional_properties: nil)
      @type = type
      @properties = properties
      @required = required if required != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "properties": properties, "required": required }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OpenAiFunctionParameters
    #
    # @param json_object [String] 
    # @return [Vapi::OpenAiFunctionParameters]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      properties = parsed_json["properties"]&.transform_values do | value |
  value = value.to_json
  Vapi::JsonSchema.from_json(json_object: value)
end
      required = parsed_json["required"]
      new(
        type: type,
        properties: properties,
        required: required,
        additional_properties: struct
      )
    end
# Serialize an instance of OpenAiFunctionParameters to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.properties.is_a?(Hash) != false || raise("Passed value for field obj.properties is not the expected type, validation failed.")
      obj.required&.is_a?(Array) != false || raise("Passed value for field obj.required is not the expected type, validation failed.")
    end
  end
end