# frozen_string_literal: true

require_relative "trieve_knowledge_base_provider"
require_relative "trieve_knowledge_base_search_plan"
require_relative "trieve_knowledge_base_import"
require "ostruct"
require "json"

module Vapi
  class TrieveKnowledgeBase
    # @return [Vapi::TrieveKnowledgeBaseProvider] This knowledge base is provided by Trieve.
    #  To learn more about Trieve, visit https://trieve.ai.
    attr_reader :provider
    # @return [String] This is the name of the knowledge base.
    attr_reader :name
    # @return [Vapi::TrieveKnowledgeBaseSearchPlan] This is the searching plan used when searching for relevant chunks from the
    #  vector store.
    #  You should configure this if you're running into these issues:
    #  - Too much unnecessary context is being fed as knowledge base context.
    #  - Not enough relevant context is being fed as knowledge base context.
    attr_reader :search_plan
    # @return [Vapi::TrieveKnowledgeBaseImport] This is the plan if you want us to create/import a new vector store using
    #  Trieve.
    attr_reader :create_plan
    # @return [String] This is the id of the knowledge base.
    attr_reader :id
    # @return [String] This is the org id of the knowledge base.
    attr_reader :org_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [Vapi::TrieveKnowledgeBaseProvider] This knowledge base is provided by Trieve.
    #  To learn more about Trieve, visit https://trieve.ai.
    # @param name [String] This is the name of the knowledge base.
    # @param search_plan [Vapi::TrieveKnowledgeBaseSearchPlan] This is the searching plan used when searching for relevant chunks from the
    #  vector store.
    #  You should configure this if you're running into these issues:
    #  - Too much unnecessary context is being fed as knowledge base context.
    #  - Not enough relevant context is being fed as knowledge base context.
    # @param create_plan [Vapi::TrieveKnowledgeBaseImport] This is the plan if you want us to create/import a new vector store using
    #  Trieve.
    # @param id [String] This is the id of the knowledge base.
    # @param org_id [String] This is the org id of the knowledge base.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TrieveKnowledgeBase]
    def initialize(provider:, id:, org_id:, name: OMIT, search_plan: OMIT, create_plan: OMIT,
                   additional_properties: nil)
      @provider = provider
      @name = name if name != OMIT
      @search_plan = search_plan if search_plan != OMIT
      @create_plan = create_plan if create_plan != OMIT
      @id = id
      @org_id = org_id
      @additional_properties = additional_properties
      @_field_set = {
        "provider": provider,
        "name": name,
        "searchPlan": search_plan,
        "createPlan": create_plan,
        "id": id,
        "orgId": org_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TrieveKnowledgeBase
    #
    # @param json_object [String]
    # @return [Vapi::TrieveKnowledgeBase]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      name = parsed_json["name"]
      if parsed_json["searchPlan"].nil?
        search_plan = nil
      else
        search_plan = parsed_json["searchPlan"].to_json
        search_plan = Vapi::TrieveKnowledgeBaseSearchPlan.from_json(json_object: search_plan)
      end
      if parsed_json["createPlan"].nil?
        create_plan = nil
      else
        create_plan = parsed_json["createPlan"].to_json
        create_plan = Vapi::TrieveKnowledgeBaseImport.from_json(json_object: create_plan)
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      new(
        provider: provider,
        name: name,
        search_plan: search_plan,
        create_plan: create_plan,
        id: id,
        org_id: org_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of TrieveKnowledgeBase to a JSON object
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
      obj.provider.is_a?(Vapi::TrieveKnowledgeBaseProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.search_plan.nil? || Vapi::TrieveKnowledgeBaseSearchPlan.validate_raw(obj: obj.search_plan)
      obj.create_plan.nil? || Vapi::TrieveKnowledgeBaseImport.validate_raw(obj: obj.create_plan)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
    end
  end
end
