# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class Say
    # @return [String]
    attr_reader :type
    # @return [String]
    attr_reader :instruction
    # @return [String]
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String]
    # @param instruction [String]
    # @param name [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Say]
    def initialize(type:, instruction:, name:, additional_properties: nil)
      @type = type
      @instruction = instruction
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "type": type, "instruction": instruction, "name": name }
    end

    # Deserialize a JSON object to an instance of Say
    #
    # @param json_object [String]
    # @return [Vapi::Say]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      instruction = parsed_json["instruction"]
      name = parsed_json["name"]
      new(
        type: type,
        instruction: instruction,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of Say to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.instruction.is_a?(String) != false || raise("Passed value for field obj.instruction is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
