# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class TrieveKnowledgeBaseVectorStoreCreatePlan
    # @return [Array<String>] These are the file ids that will be used to create the vector store. To upload
    #  files, use the `POST /files` endpoint.
    attr_reader :file_ids
    # @return [Float] This is an optional field which allows you to specify the number of splits you
    #  want per chunk. If not specified, the default 20 is used. However, you may want
    #  to use a different number.
    attr_reader :target_splits_per_chunk
    # @return [Array<String>] This is an optional field which allows you to specify the delimiters to use when
    #  splitting the file before chunking the text. If not specified, the default
    #  [.!?\n] are used to split into sentences. However, you may want to use spaces or
    #  other delimiters.
    attr_reader :split_delimiters
    # @return [Boolean] This is an optional field which allows you to specify whether or not to
    #  rebalance the chunks created from the file. If not specified, the default true
    #  is used. If true, Trieve will evenly distribute remainder splits across chunks
    #  such that 66 splits with a target_splits_per_chunk of 20 will result in 3 chunks
    #  with 22 splits each.
    attr_reader :rebalance_chunks
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param file_ids [Array<String>] These are the file ids that will be used to create the vector store. To upload
    #  files, use the `POST /files` endpoint.
    # @param target_splits_per_chunk [Float] This is an optional field which allows you to specify the number of splits you
    #  want per chunk. If not specified, the default 20 is used. However, you may want
    #  to use a different number.
    # @param split_delimiters [Array<String>] This is an optional field which allows you to specify the delimiters to use when
    #  splitting the file before chunking the text. If not specified, the default
    #  [.!?\n] are used to split into sentences. However, you may want to use spaces or
    #  other delimiters.
    # @param rebalance_chunks [Boolean] This is an optional field which allows you to specify whether or not to
    #  rebalance the chunks created from the file. If not specified, the default true
    #  is used. If true, Trieve will evenly distribute remainder splits across chunks
    #  such that 66 splits with a target_splits_per_chunk of 20 will result in 3 chunks
    #  with 22 splits each.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TrieveKnowledgeBaseVectorStoreCreatePlan]
    def initialize(file_ids:, target_splits_per_chunk: OMIT, split_delimiters: OMIT, rebalance_chunks: OMIT,
                   additional_properties: nil)
      @file_ids = file_ids
      @target_splits_per_chunk = target_splits_per_chunk if target_splits_per_chunk != OMIT
      @split_delimiters = split_delimiters if split_delimiters != OMIT
      @rebalance_chunks = rebalance_chunks if rebalance_chunks != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "fileIds": file_ids,
        "targetSplitsPerChunk": target_splits_per_chunk,
        "splitDelimiters": split_delimiters,
        "rebalanceChunks": rebalance_chunks
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of
    #  TrieveKnowledgeBaseVectorStoreCreatePlan
    #
    # @param json_object [String]
    # @return [Vapi::TrieveKnowledgeBaseVectorStoreCreatePlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      file_ids = parsed_json["fileIds"]
      target_splits_per_chunk = parsed_json["targetSplitsPerChunk"]
      split_delimiters = parsed_json["splitDelimiters"]
      rebalance_chunks = parsed_json["rebalanceChunks"]
      new(
        file_ids: file_ids,
        target_splits_per_chunk: target_splits_per_chunk,
        split_delimiters: split_delimiters,
        rebalance_chunks: rebalance_chunks,
        additional_properties: struct
      )
    end

    # Serialize an instance of TrieveKnowledgeBaseVectorStoreCreatePlan to a JSON
    #  object
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
      obj.file_ids.is_a?(Array) != false || raise("Passed value for field obj.file_ids is not the expected type, validation failed.")
      obj.target_splits_per_chunk&.is_a?(Float) != false || raise("Passed value for field obj.target_splits_per_chunk is not the expected type, validation failed.")
      obj.split_delimiters&.is_a?(Array) != false || raise("Passed value for field obj.split_delimiters is not the expected type, validation failed.")
      obj.rebalance_chunks&.is_a?(Boolean) != false || raise("Passed value for field obj.rebalance_chunks is not the expected type, validation failed.")
    end
  end
end
