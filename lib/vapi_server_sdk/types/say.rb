# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class Say
    # @return [String]
    attr_reader :exact
    # @return [String]
    attr_reader :prompt
    # @return [String]
    attr_reader :name
    # @return [Hash{String => Object}] This is for metadata you want to store on the task.
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param exact [String]
    # @param prompt [String]
    # @param name [String]
    # @param metadata [Hash{String => Object}] This is for metadata you want to store on the task.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Say]
    def initialize(name:, exact: OMIT, prompt: OMIT, metadata: OMIT, additional_properties: nil)
      @exact = exact if exact != OMIT
      @prompt = prompt if prompt != OMIT
      @name = name
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "exact": exact, "prompt": prompt, "name": name, "metadata": metadata }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Say
    #
    # @param json_object [String]
    # @return [Vapi::Say]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      exact = parsed_json["exact"]
      prompt = parsed_json["prompt"]
      name = parsed_json["name"]
      metadata = parsed_json["metadata"]
      new(
        exact: exact,
        prompt: prompt,
        name: name,
        metadata: metadata,
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
      obj.exact&.is_a?(String) != false || raise("Passed value for field obj.exact is not the expected type, validation failed.")
      obj.prompt&.is_a?(String) != false || raise("Passed value for field obj.prompt is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
