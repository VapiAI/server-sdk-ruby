# frozen_string_literal: true

require_relative "trieve_knowledge_base_chunk_plan"
require "ostruct"
require "json"

module Vapi
  class TrieveKnowledgeBaseCreate
    # @return [Array<Vapi::TrieveKnowledgeBaseChunkPlan>] These are the chunk plans used to create the dataset.
    attr_reader :chunk_plans
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param chunk_plans [Array<Vapi::TrieveKnowledgeBaseChunkPlan>] These are the chunk plans used to create the dataset.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TrieveKnowledgeBaseCreate]
    def initialize(chunk_plans:, additional_properties: nil)
      @chunk_plans = chunk_plans
      @additional_properties = additional_properties
      @_field_set = { "chunkPlans": chunk_plans }
    end

    # Deserialize a JSON object to an instance of TrieveKnowledgeBaseCreate
    #
    # @param json_object [String]
    # @return [Vapi::TrieveKnowledgeBaseCreate]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      chunk_plans = parsed_json["chunkPlans"]&.map do |item|
        item = item.to_json
        Vapi::TrieveKnowledgeBaseChunkPlan.from_json(json_object: item)
      end
      new(chunk_plans: chunk_plans, additional_properties: struct)
    end

    # Serialize an instance of TrieveKnowledgeBaseCreate to a JSON object
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
      obj.chunk_plans.is_a?(Array) != false || raise("Passed value for field obj.chunk_plans is not the expected type, validation failed.")
    end
  end
end
