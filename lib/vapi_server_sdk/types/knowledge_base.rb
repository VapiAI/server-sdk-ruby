# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class KnowledgeBase
    # @return [String]
    attr_reader :provider
    # @return [Float]
    attr_reader :top_k
    # @return [Array<String>]
    attr_reader :file_ids
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String]
    # @param top_k [Float]
    # @param file_ids [Array<String>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::KnowledgeBase]
    def initialize(provider:, file_ids:, top_k: OMIT, additional_properties: nil)
      @provider = provider
      @top_k = top_k if top_k != OMIT
      @file_ids = file_ids
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "topK": top_k, "fileIds": file_ids }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of KnowledgeBase
    #
    # @param json_object [String]
    # @return [Vapi::KnowledgeBase]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      top_k = parsed_json["topK"]
      file_ids = parsed_json["fileIds"]
      new(
        provider: provider,
        top_k: top_k,
        file_ids: file_ids,
        additional_properties: struct
      )
    end

    # Serialize an instance of KnowledgeBase to a JSON object
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
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.top_k&.is_a?(Float) != false || raise("Passed value for field obj.top_k is not the expected type, validation failed.")
      obj.file_ids.is_a?(Array) != false || raise("Passed value for field obj.file_ids is not the expected type, validation failed.")
    end
  end
end
