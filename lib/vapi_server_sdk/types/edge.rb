# frozen_string_literal: true

require_relative "ai_edge_condition"
require "ostruct"
require "json"

module Vapi
  class Edge
    # @return [Vapi::AiEdgeCondition]
    attr_reader :condition
    # @return [String]
    attr_reader :from
    # @return [String]
    attr_reader :to
    # @return [Hash{String => Object}] This is for metadata you want to store on the edge.
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param condition [Vapi::AiEdgeCondition]
    # @param from [String]
    # @param to [String]
    # @param metadata [Hash{String => Object}] This is for metadata you want to store on the edge.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Edge]
    def initialize(from:, to:, condition: OMIT, metadata: OMIT, additional_properties: nil)
      @condition = condition if condition != OMIT
      @from = from
      @to = to
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "condition": condition, "from": from, "to": to, "metadata": metadata }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Edge
    #
    # @param json_object [String]
    # @return [Vapi::Edge]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["condition"].nil?
        condition = nil
      else
        condition = parsed_json["condition"].to_json
        condition = Vapi::AiEdgeCondition.from_json(json_object: condition)
      end
      from = parsed_json["from"]
      to = parsed_json["to"]
      metadata = parsed_json["metadata"]
      new(
        condition: condition,
        from: from,
        to: to,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of Edge to a JSON object
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
      obj.condition.nil? || Vapi::AiEdgeCondition.validate_raw(obj: obj.condition)
      obj.from.is_a?(String) != false || raise("Passed value for field obj.from is not the expected type, validation failed.")
      obj.to.is_a?(String) != false || raise("Passed value for field obj.to is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
