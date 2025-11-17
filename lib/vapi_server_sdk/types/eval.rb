# frozen_string_literal: true

require_relative "eval_messages_item"
require "date"
require_relative "eval_type"
require "ostruct"
require "json"

module Vapi
  class Eval
    # @return [Array<Vapi::EvalMessagesItem>] This is the mock conversation that will be used to evaluate the flow of the
    #  conversation.
    #  Mock Messages are used to simulate the flow of the conversation
    #  Evaluation Messages are used as checkpoints in the flow where the model's
    #  response to previous conversation needs to be evaluated to check the content and
    #  tool calls
    attr_reader :messages
    # @return [String]
    attr_reader :id
    # @return [String]
    attr_reader :org_id
    # @return [DateTime]
    attr_reader :created_at
    # @return [DateTime]
    attr_reader :updated_at
    # @return [String] This is the name of the eval.
    #  It helps identify what the eval is checking for.
    attr_reader :name
    # @return [String] This is the description of the eval.
    #  This helps describe the eval and its purpose in detail. It will not be used to
    #  evaluate the flow of the conversation.
    attr_reader :description
    # @return [Vapi::EvalType] This is the type of the eval.
    #  Currently it is fixed to `chat.mockConversation`.
    attr_reader :type
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::EvalMessagesItem>] This is the mock conversation that will be used to evaluate the flow of the
    #  conversation.
    #  Mock Messages are used to simulate the flow of the conversation
    #  Evaluation Messages are used as checkpoints in the flow where the model's
    #  response to previous conversation needs to be evaluated to check the content and
    #  tool calls
    # @param id [String]
    # @param org_id [String]
    # @param created_at [DateTime]
    # @param updated_at [DateTime]
    # @param name [String] This is the name of the eval.
    #  It helps identify what the eval is checking for.
    # @param description [String] This is the description of the eval.
    #  This helps describe the eval and its purpose in detail. It will not be used to
    #  evaluate the flow of the conversation.
    # @param type [Vapi::EvalType] This is the type of the eval.
    #  Currently it is fixed to `chat.mockConversation`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Eval]
    def initialize(messages:, id:, org_id:, created_at:, updated_at:, type:, name: OMIT, description: OMIT,
                   additional_properties: nil)
      @messages = messages
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @description = description if description != OMIT
      @type = type
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "name": name,
        "description": description,
        "type": type
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Eval
    #
    # @param json_object [String]
    # @return [Vapi::Eval]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::EvalMessagesItem.from_json(json_object: item)
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      name = parsed_json["name"]
      description = parsed_json["description"]
      type = parsed_json["type"]
      new(
        messages: messages,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        description: description,
        type: type,
        additional_properties: struct
      )
    end

    # Serialize an instance of Eval to a JSON object
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
      obj.messages.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.type.is_a?(Vapi::EvalType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end
