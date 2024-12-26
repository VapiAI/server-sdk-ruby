# frozen_string_literal: true

require_relative "knowledge_base_response_document"
require_relative "custom_message"
require "ostruct"
require "json"

module Vapi
  class ServerMessageResponseKnowledgeBaseRequest
    # @return [Array<Vapi::KnowledgeBaseResponseDocument>] This is the list of documents that will be sent to the model alongside the
    #  `messages` to generate a response.
    attr_reader :documents
    # @return [Vapi::CustomMessage] This can be used to skip the model output generation and speak a custom message.
    attr_reader :message
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param documents [Array<Vapi::KnowledgeBaseResponseDocument>] This is the list of documents that will be sent to the model alongside the
    #  `messages` to generate a response.
    # @param message [Vapi::CustomMessage] This can be used to skip the model output generation and speak a custom message.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessageResponseKnowledgeBaseRequest]
    def initialize(documents: OMIT, message: OMIT, additional_properties: nil)
      @documents = documents if documents != OMIT
      @message = message if message != OMIT
      @additional_properties = additional_properties
      @_field_set = { "documents": documents, "message": message }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of
    #  ServerMessageResponseKnowledgeBaseRequest
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageResponseKnowledgeBaseRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      documents = parsed_json["documents"]&.map do |item|
        item = item.to_json
        Vapi::KnowledgeBaseResponseDocument.from_json(json_object: item)
      end
      if parsed_json["message"].nil?
        message = nil
      else
        message = parsed_json["message"].to_json
        message = Vapi::CustomMessage.from_json(json_object: message)
      end
      new(
        documents: documents,
        message: message,
        additional_properties: struct
      )
    end

    # Serialize an instance of ServerMessageResponseKnowledgeBaseRequest to a JSON
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
      obj.documents&.is_a?(Array) != false || raise("Passed value for field obj.documents is not the expected type, validation failed.")
      obj.message.nil? || Vapi::CustomMessage.validate_raw(obj: obj.message)
    end
  end
end
