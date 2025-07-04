# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class WorkflowOverrides
    # @return [Hash{String => Object}] These are values that will be used to replace the template variables in the
    #  workflow messages and other text-based fields.
    #  This uses LiquidJS syntax. https://liquidjs.com/tutorials/intro-to-liquid.html
    #  So for example, `{{ name }}` will be replaced with the value of `name` in
    #  `variableValues`.
    #  `{{"now" | date: "%b %d, %Y, %I:%M %p", "America/New_York"}}` will be replaced
    #  with the current date and time in New York.
    #  Some VAPI reserved defaults:
    #  - *customer* - the customer object
    attr_reader :variable_values
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param variable_values [Hash{String => Object}] These are values that will be used to replace the template variables in the
    #  workflow messages and other text-based fields.
    #  This uses LiquidJS syntax. https://liquidjs.com/tutorials/intro-to-liquid.html
    #  So for example, `{{ name }}` will be replaced with the value of `name` in
    #  `variableValues`.
    #  `{{"now" | date: "%b %d, %Y, %I:%M %p", "America/New_York"}}` will be replaced
    #  with the current date and time in New York.
    #  Some VAPI reserved defaults:
    #  - *customer* - the customer object
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::WorkflowOverrides]
    def initialize(variable_values: OMIT, additional_properties: nil)
      @variable_values = variable_values if variable_values != OMIT
      @additional_properties = additional_properties
      @_field_set = { "variableValues": variable_values }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of WorkflowOverrides
    #
    # @param json_object [String]
    # @return [Vapi::WorkflowOverrides]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      variable_values = parsed_json["variableValues"]
      new(variable_values: variable_values, additional_properties: struct)
    end

    # Serialize an instance of WorkflowOverrides to a JSON object
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
      obj.variable_values&.is_a?(Hash) != false || raise("Passed value for field obj.variable_values is not the expected type, validation failed.")
    end
  end
end
