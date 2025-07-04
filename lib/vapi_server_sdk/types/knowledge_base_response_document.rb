# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class KnowledgeBaseResponseDocument
    # @return [String] This is the content of the document.
    attr_reader :content
    # @return [Float] This is the similarity score of the document.
    attr_reader :similarity
    # @return [String] This is the uuid of the document.
    attr_reader :uuid
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param content [String] This is the content of the document.
    # @param similarity [Float] This is the similarity score of the document.
    # @param uuid [String] This is the uuid of the document.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::KnowledgeBaseResponseDocument]
    def initialize(content:, similarity:, uuid: OMIT, additional_properties: nil)
      @content = content
      @similarity = similarity
      @uuid = uuid if uuid != OMIT
      @additional_properties = additional_properties
      @_field_set = { "content": content, "similarity": similarity, "uuid": uuid }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of KnowledgeBaseResponseDocument
    #
    # @param json_object [String]
    # @return [Vapi::KnowledgeBaseResponseDocument]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      content = parsed_json["content"]
      similarity = parsed_json["similarity"]
      uuid = parsed_json["uuid"]
      new(
        content: content,
        similarity: similarity,
        uuid: uuid,
        additional_properties: struct
      )
    end

    # Serialize an instance of KnowledgeBaseResponseDocument to a JSON object
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
      obj.content.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.similarity.is_a?(Float) != false || raise("Passed value for field obj.similarity is not the expected type, validation failed.")
      obj.uuid&.is_a?(String) != false || raise("Passed value for field obj.uuid is not the expected type, validation failed.")
    end
  end
end
