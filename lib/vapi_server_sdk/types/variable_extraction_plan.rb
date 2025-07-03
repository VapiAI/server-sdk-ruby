# frozen_string_literal: true
require_relative "json_schema"
require_relative "variable_extraction_alias"
require "ostruct"
require "json"

module Vapi
  class VariableExtractionPlan
  # @return [Vapi::JsonSchema] This is the schema to extract.
#  Examples:
#  1. To extract object properties, you can use the following schema:
#  ```json
#  {
#  "type": "object",
#  "properties": {
#  "name": {
#  "type": "string"
#  },
#  "age": {
#  "type": "number"
#  }
#  }
#  }
#  ```
#  These will be extracted as `{{ name }}` and `{{ age }}` respectively. To
#  emphasize, object properties are extracted as direct global variables.
#  2. To extract nested properties, you can use the following schema:
#  ```json
#  {
#  "type": "object",
#  "properties": {
#  "name": {
#  "type": "object",
#  "properties": {
#  "first": {
#  "type": "string"
#  },
#  "last": {
#  "type": "string"
#  }
#  }
#  }
#  }
#  }
#  ```
#  These will be extracted as `{{ name }}`. And, `{{ name.first }}` and `{{
#  name.last }}` will be accessible.
#  3. To extract array items, you can use the following schema:
#  ```json
#  {
#  "type": "array",
#  "title": "zipCodes",
#  "items": {
#  "type": "string"
#  }
#  }
#  ```
#  This will be extracted as `{{ zipCodes }}`. To access the array items, you can
#  use `{{ zipCodes[0] }}` and `{{ zipCodes[1] }}`.
#  4. To extract array of objects, you can use the following schema:
#  ```json
#  {
#  "type": "array",
#  "name": "people",
#  "items": {
#  "type": "object",
#  "properties": {
#  "name": {
#  "type": "string"
#  },
#  "age": {
#  "type": "number"
#  },
#  "zipCodes": {
#  "type": "array",
#  "items": {
#  "type": "string"
#  }
#  }
#  }
#  }
#  }
#  ```
#  This will be extracted as `{{ people }}`. To access the array items, you can use
#  `{{ people[n].name }}`, `{{ people[n].age }}`, `{{ people[n].zipCodes }}`, `{{
#  people[n].zipCodes[0] }}` and `{{ people[n].zipCodes[1] }}`.
    attr_reader :schema
  # @return [Array<Vapi::VariableExtractionAlias>] These are additional variables to create.
#  These will be accessible during the call as `{{key}}` and stored in
#  `call.artifact.variableValues` after the call.
#  Example:
#  ```json
#  {
#  "aliases": [
#  {
#  "key": "customerName",
#  "value": "{{name}}"
#  },
#  {
#  "key": "fullName",
#  "value": "{{firstName}} {{lastName}}"
#  },
#  {
#  "key": "greeting",
#  "value": "Hello {{name}}, welcome to {{company}}!"
#  },
#  {
#  "key": "customerEmail",
#  "value": "{{addresses[0].city}}"
#  },
#  {
#  "key": "something",
#  "value": "{{any liquid}}"
#  }
#  ]
#  }
#  ```
#  This will create variables `customerName`, `fullName`, `customerEmail`,
#  `greeting`, and `something`. To access these variables, you can reference them
#  as `{{customerName}}`, `{{fullName}}`, `{{customerEmail}}`, `{{greeting}}`, and
#  `{{something}}`.
    attr_reader :aliases
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param schema [Vapi::JsonSchema] This is the schema to extract.
#  Examples:
#  1. To extract object properties, you can use the following schema:
#  ```json
#  {
#  "type": "object",
#  "properties": {
#  "name": {
#  "type": "string"
#  },
#  "age": {
#  "type": "number"
#  }
#  }
#  }
#  ```
#  These will be extracted as `{{ name }}` and `{{ age }}` respectively. To
#  emphasize, object properties are extracted as direct global variables.
#  2. To extract nested properties, you can use the following schema:
#  ```json
#  {
#  "type": "object",
#  "properties": {
#  "name": {
#  "type": "object",
#  "properties": {
#  "first": {
#  "type": "string"
#  },
#  "last": {
#  "type": "string"
#  }
#  }
#  }
#  }
#  }
#  ```
#  These will be extracted as `{{ name }}`. And, `{{ name.first }}` and `{{
#  name.last }}` will be accessible.
#  3. To extract array items, you can use the following schema:
#  ```json
#  {
#  "type": "array",
#  "title": "zipCodes",
#  "items": {
#  "type": "string"
#  }
#  }
#  ```
#  This will be extracted as `{{ zipCodes }}`. To access the array items, you can
#  use `{{ zipCodes[0] }}` and `{{ zipCodes[1] }}`.
#  4. To extract array of objects, you can use the following schema:
#  ```json
#  {
#  "type": "array",
#  "name": "people",
#  "items": {
#  "type": "object",
#  "properties": {
#  "name": {
#  "type": "string"
#  },
#  "age": {
#  "type": "number"
#  },
#  "zipCodes": {
#  "type": "array",
#  "items": {
#  "type": "string"
#  }
#  }
#  }
#  }
#  }
#  ```
#  This will be extracted as `{{ people }}`. To access the array items, you can use
#  `{{ people[n].name }}`, `{{ people[n].age }}`, `{{ people[n].zipCodes }}`, `{{
#  people[n].zipCodes[0] }}` and `{{ people[n].zipCodes[1] }}`.
    # @param aliases [Array<Vapi::VariableExtractionAlias>] These are additional variables to create.
#  These will be accessible during the call as `{{key}}` and stored in
#  `call.artifact.variableValues` after the call.
#  Example:
#  ```json
#  {
#  "aliases": [
#  {
#  "key": "customerName",
#  "value": "{{name}}"
#  },
#  {
#  "key": "fullName",
#  "value": "{{firstName}} {{lastName}}"
#  },
#  {
#  "key": "greeting",
#  "value": "Hello {{name}}, welcome to {{company}}!"
#  },
#  {
#  "key": "customerEmail",
#  "value": "{{addresses[0].city}}"
#  },
#  {
#  "key": "something",
#  "value": "{{any liquid}}"
#  }
#  ]
#  }
#  ```
#  This will create variables `customerName`, `fullName`, `customerEmail`,
#  `greeting`, and `something`. To access these variables, you can reference them
#  as `{{customerName}}`, `{{fullName}}`, `{{customerEmail}}`, `{{greeting}}`, and
#  `{{something}}`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VariableExtractionPlan]
    def initialize(schema: OMIT, aliases: OMIT, additional_properties: nil)
      @schema = schema if schema != OMIT
      @aliases = aliases if aliases != OMIT
      @additional_properties = additional_properties
      @_field_set = { "schema": schema, "aliases": aliases }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of VariableExtractionPlan
    #
    # @param json_object [String] 
    # @return [Vapi::VariableExtractionPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["schema"].nil?
        schema = parsed_json["schema"].to_json
        schema = Vapi::JsonSchema.from_json(json_object: schema)
      else
        schema = nil
      end
      aliases = parsed_json["aliases"]&.map do | item |
  item = item.to_json
  Vapi::VariableExtractionAlias.from_json(json_object: item)
end
      new(
        schema: schema,
        aliases: aliases,
        additional_properties: struct
      )
    end
# Serialize an instance of VariableExtractionPlan to a JSON object
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
      obj.schema.nil? || Vapi::JsonSchema.validate_raw(obj: obj.schema)
      obj.aliases&.is_a?(Array) != false || raise("Passed value for field obj.aliases is not the expected type, validation failed.")
    end
  end
end