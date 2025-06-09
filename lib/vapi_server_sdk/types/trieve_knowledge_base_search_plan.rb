# frozen_string_literal: true
require_relative "trieve_knowledge_base_search_plan_search_type"
require "ostruct"
require "json"

module Vapi
  class TrieveKnowledgeBaseSearchPlan
  # @return [Float] Specifies the number of top chunks to return. This corresponds to the
#  `page_size` parameter in Trieve.
    attr_reader :top_k
  # @return [Boolean] If true, stop words (specified in server/src/stop-words.txt in the git repo)
#  will be removed. This will preserve queries that are entirely stop words.
    attr_reader :remove_stop_words
  # @return [Float] This is the score threshold to filter out chunks with a score below the
#  threshold for cosine distance metric. For Manhattan Distance, Euclidean
#  Distance, and Dot Product, it will filter out scores above the threshold
#  distance. This threshold applies before weight and bias modifications. If not
#  specified, this defaults to no threshold. A threshold of 0 will default to no
#  threshold.
    attr_reader :score_threshold
  # @return [Vapi::TrieveKnowledgeBaseSearchPlanSearchType] This is the search method used when searching for relevant chunks from the
#  vector store.
    attr_reader :search_type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param top_k [Float] Specifies the number of top chunks to return. This corresponds to the
#  `page_size` parameter in Trieve.
    # @param remove_stop_words [Boolean] If true, stop words (specified in server/src/stop-words.txt in the git repo)
#  will be removed. This will preserve queries that are entirely stop words.
    # @param score_threshold [Float] This is the score threshold to filter out chunks with a score below the
#  threshold for cosine distance metric. For Manhattan Distance, Euclidean
#  Distance, and Dot Product, it will filter out scores above the threshold
#  distance. This threshold applies before weight and bias modifications. If not
#  specified, this defaults to no threshold. A threshold of 0 will default to no
#  threshold.
    # @param search_type [Vapi::TrieveKnowledgeBaseSearchPlanSearchType] This is the search method used when searching for relevant chunks from the
#  vector store.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TrieveKnowledgeBaseSearchPlan]
    def initialize(top_k: OMIT, remove_stop_words: OMIT, score_threshold: OMIT, search_type:, additional_properties: nil)
      @top_k = top_k if top_k != OMIT
      @remove_stop_words = remove_stop_words if remove_stop_words != OMIT
      @score_threshold = score_threshold if score_threshold != OMIT
      @search_type = search_type
      @additional_properties = additional_properties
      @_field_set = { "topK": top_k, "removeStopWords": remove_stop_words, "scoreThreshold": score_threshold, "searchType": search_type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TrieveKnowledgeBaseSearchPlan
    #
    # @param json_object [String] 
    # @return [Vapi::TrieveKnowledgeBaseSearchPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      top_k = parsed_json["topK"]
      remove_stop_words = parsed_json["removeStopWords"]
      score_threshold = parsed_json["scoreThreshold"]
      search_type = parsed_json["searchType"]
      new(
        top_k: top_k,
        remove_stop_words: remove_stop_words,
        score_threshold: score_threshold,
        search_type: search_type,
        additional_properties: struct
      )
    end
# Serialize an instance of TrieveKnowledgeBaseSearchPlan to a JSON object
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
      obj.top_k&.is_a?(Float) != false || raise("Passed value for field obj.top_k is not the expected type, validation failed.")
      obj.remove_stop_words&.is_a?(Boolean) != false || raise("Passed value for field obj.remove_stop_words is not the expected type, validation failed.")
      obj.score_threshold&.is_a?(Float) != false || raise("Passed value for field obj.score_threshold is not the expected type, validation failed.")
      obj.search_type.is_a?(Vapi::TrieveKnowledgeBaseSearchPlanSearchType) != false || raise("Passed value for field obj.search_type is not the expected type, validation failed.")
    end
  end
end