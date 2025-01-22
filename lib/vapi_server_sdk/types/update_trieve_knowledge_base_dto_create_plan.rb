# frozen_string_literal: true

require "json"
require_relative "trieve_knowledge_base_create"
require_relative "trieve_knowledge_base_import"

module Vapi
  # This is the plan if you want us to create/import a new vector store using
  #  Trieve.
  class UpdateTrieveKnowledgeBaseDtoCreatePlan
    # @return [Object]
    attr_reader :member
    # @return [String]
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object]
    # @param discriminant [String]
    # @return [Vapi::UpdateTrieveKnowledgeBaseDtoCreatePlan]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of
    #  UpdateTrieveKnowledgeBaseDtoCreatePlan
    #
    # @param json_object [String]
    # @return [Vapi::UpdateTrieveKnowledgeBaseDtoCreatePlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "create"
                 Vapi::TrieveKnowledgeBaseCreate.from_json(json_object: json_object)
               when "import"
                 Vapi::TrieveKnowledgeBaseImport.from_json(json_object: json_object)
               else
                 Vapi::TrieveKnowledgeBaseCreate.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json(*_args)
      case @discriminant
      when "create"
        { **@member.to_json, type: @discriminant }.to_json
      when "import"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "create"
        Vapi::TrieveKnowledgeBaseCreate.validate_raw(obj: obj)
      when "import"
        Vapi::TrieveKnowledgeBaseImport.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end

    # For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object]
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end

    # @param member [Vapi::TrieveKnowledgeBaseCreate]
    # @return [Vapi::UpdateTrieveKnowledgeBaseDtoCreatePlan]
    def self.create(member:)
      new(member: member, discriminant: "create")
    end

    # @param member [Vapi::TrieveKnowledgeBaseImport]
    # @return [Vapi::UpdateTrieveKnowledgeBaseDtoCreatePlan]
    def self.import(member:)
      new(member: member, discriminant: "import")
    end
  end
end
