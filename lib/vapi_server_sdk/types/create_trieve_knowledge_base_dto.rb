# frozen_string_literal: true

require_relative "trieve_knowledge_base_vector_store_search_plan"
require_relative "trieve_knowledge_base_vector_store_create_plan"
require "ostruct"
require "json"

module Vapi
  class CreateTrieveKnowledgeBaseDto
    # @return [String] This is the name of the knowledge base.
    attr_reader :name
    # @return [Vapi::TrieveKnowledgeBaseVectorStoreSearchPlan] This is the plan on how to search the vector store while a call is going on.
    attr_reader :vector_store_search_plan
    # @return [Vapi::TrieveKnowledgeBaseVectorStoreCreatePlan] This is the plan if you want us to create a new vector store on your behalf. To
    #  use an existing vector store from your account, use `vectoreStoreProviderId`
    attr_reader :vector_store_create_plan
    # @return [String] This is an vector store that you already have on your account with the provider.
    #  To create a new vector store, use vectorStoreCreatePlan.
    #  Usage:
    #  - To bring your own vector store from Trieve, go to https://trieve.ai
    #  - Create a dataset, and use the datasetId here.
    attr_reader :vector_store_provider_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of the knowledge base.
    # @param vector_store_search_plan [Vapi::TrieveKnowledgeBaseVectorStoreSearchPlan] This is the plan on how to search the vector store while a call is going on.
    # @param vector_store_create_plan [Vapi::TrieveKnowledgeBaseVectorStoreCreatePlan] This is the plan if you want us to create a new vector store on your behalf. To
    #  use an existing vector store from your account, use `vectoreStoreProviderId`
    # @param vector_store_provider_id [String] This is an vector store that you already have on your account with the provider.
    #  To create a new vector store, use vectorStoreCreatePlan.
    #  Usage:
    #  - To bring your own vector store from Trieve, go to https://trieve.ai
    #  - Create a dataset, and use the datasetId here.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateTrieveKnowledgeBaseDto]
    def initialize(vector_store_search_plan:, name: OMIT, vector_store_create_plan: OMIT,
                   vector_store_provider_id: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @vector_store_search_plan = vector_store_search_plan
      @vector_store_create_plan = vector_store_create_plan if vector_store_create_plan != OMIT
      @vector_store_provider_id = vector_store_provider_id if vector_store_provider_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "vectorStoreSearchPlan": vector_store_search_plan,
        "vectorStoreCreatePlan": vector_store_create_plan,
        "vectorStoreProviderId": vector_store_provider_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateTrieveKnowledgeBaseDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateTrieveKnowledgeBaseDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      if parsed_json["vectorStoreSearchPlan"].nil?
        vector_store_search_plan = nil
      else
        vector_store_search_plan = parsed_json["vectorStoreSearchPlan"].to_json
        vector_store_search_plan = Vapi::TrieveKnowledgeBaseVectorStoreSearchPlan.from_json(json_object: vector_store_search_plan)
      end
      if parsed_json["vectorStoreCreatePlan"].nil?
        vector_store_create_plan = nil
      else
        vector_store_create_plan = parsed_json["vectorStoreCreatePlan"].to_json
        vector_store_create_plan = Vapi::TrieveKnowledgeBaseVectorStoreCreatePlan.from_json(json_object: vector_store_create_plan)
      end
      vector_store_provider_id = parsed_json["vectorStoreProviderId"]
      new(
        name: name,
        vector_store_search_plan: vector_store_search_plan,
        vector_store_create_plan: vector_store_create_plan,
        vector_store_provider_id: vector_store_provider_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateTrieveKnowledgeBaseDto to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      Vapi::TrieveKnowledgeBaseVectorStoreSearchPlan.validate_raw(obj: obj.vector_store_search_plan)
      obj.vector_store_create_plan.nil? || Vapi::TrieveKnowledgeBaseVectorStoreCreatePlan.validate_raw(obj: obj.vector_store_create_plan)
      obj.vector_store_provider_id&.is_a?(String) != false || raise("Passed value for field obj.vector_store_provider_id is not the expected type, validation failed.")
    end
  end
end
