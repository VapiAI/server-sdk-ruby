# frozen_string_literal: true
require_relative "knowledge_base_model"
require "ostruct"
require "json"

module Vapi
  class KnowledgeBase
  # @return [String] The name of the knowledge base
    attr_reader :name
  # @return [String] The provider of the knowledge base
    attr_reader :provider
  # @return [Vapi::KnowledgeBaseModel] The model to use for the knowledge base
    attr_reader :model
  # @return [String] A description of the knowledge base
    attr_reader :description
  # @return [Array<String>] The file IDs associated with this knowledge base
    attr_reader :file_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the knowledge base
    # @param provider [String] The provider of the knowledge base
    # @param model [Vapi::KnowledgeBaseModel] The model to use for the knowledge base
    # @param description [String] A description of the knowledge base
    # @param file_ids [Array<String>] The file IDs associated with this knowledge base
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::KnowledgeBase]
    def initialize(name:, provider:, model: OMIT, description:, file_ids:, additional_properties: nil)
      @name = name
      @provider = provider
      @model = model if model != OMIT
      @description = description
      @file_ids = file_ids
      @additional_properties = additional_properties
      @_field_set = { "name": name, "provider": provider, "model": model, "description": description, "fileIds": file_ids }.reject do | _k, v |
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
      name = parsed_json["name"]
      provider = parsed_json["provider"]
      model = parsed_json["model"]
      description = parsed_json["description"]
      file_ids = parsed_json["fileIds"]
      new(
        name: name,
        provider: provider,
        model: model,
        description: description,
        file_ids: file_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of KnowledgeBase to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.model&.is_a?(Vapi::KnowledgeBaseModel) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.file_ids.is_a?(Array) != false || raise("Passed value for field obj.file_ids is not the expected type, validation failed.")
    end
  end
end