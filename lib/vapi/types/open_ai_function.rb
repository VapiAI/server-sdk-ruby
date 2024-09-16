# frozen_string_literal: true

require_relative "open_ai_function_parameters"
require "ostruct"
require "json"

module Vapi
  class OpenAiFunction
    # @return [String] This is the the name of the function to be called.
    #  Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length
    #  of 64.
    attr_reader :name
    # @return [String]
    attr_reader :description
    # @return [Vapi::OpenAiFunctionParameters] These are the parameters the functions accepts, described as a JSON Schema
    #  object.
    #  See the [OpenAI guide](https://platform.openai.com/docs/guides/function-calling)
    #  for examples, and the [JSON Schema
    #  reference](https://json-schema.org/understanding-json-schema) for documentation
    #  about the format.
    #  Omitting parameters defines a function with an empty parameter list.
    attr_reader :parameters
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the the name of the function to be called.
    #  Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length
    #  of 64.
    # @param description [String]
    # @param parameters [Vapi::OpenAiFunctionParameters] These are the parameters the functions accepts, described as a JSON Schema
    #  object.
    #  See the [OpenAI guide](https://platform.openai.com/docs/guides/function-calling)
    #  for examples, and the [JSON Schema
    #  reference](https://json-schema.org/understanding-json-schema) for documentation
    #  about the format.
    #  Omitting parameters defines a function with an empty parameter list.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::OpenAiFunction]
    def initialize(name:, description: OMIT, parameters: OMIT, additional_properties: nil)
      @name = name
      @description = description if description != OMIT
      @parameters = parameters if parameters != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "description": description, "parameters": parameters }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of OpenAiFunction
    #
    # @param json_object [String]
    # @return [Vapi::OpenAiFunction]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      description = parsed_json["description"]
      if parsed_json["parameters"].nil?
        parameters = nil
      else
        parameters = parsed_json["parameters"].to_json
        parameters = Vapi::OpenAiFunctionParameters.from_json(json_object: parameters)
      end
      new(
        name: name,
        description: description,
        parameters: parameters,
        additional_properties: struct
      )
    end

    # Serialize an instance of OpenAiFunction to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.parameters.nil? || Vapi::OpenAiFunctionParameters.validate_raw(obj: obj.parameters)
    end
  end
end
