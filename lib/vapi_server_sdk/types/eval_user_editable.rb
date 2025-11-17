# frozen_string_literal: true

require_relative "eval_user_editable_messages_item"
require_relative "eval_user_editable_type"
require "ostruct"
require "json"

module Vapi
  class EvalUserEditable
    # @return [Array<Vapi::EvalUserEditableMessagesItem>] This is the mock conversation that will be used to evaluate the flow of the
    #  conversation.
    #  Mock Messages are used to simulate the flow of the conversation
    #  Evaluation Messages are used as checkpoints in the flow where the model's
    #  response to previous conversation needs to be evaluated to check the content and
    #  tool calls
    attr_reader :messages
    # @return [String] This is the name of the eval.
    #  It helps identify what the eval is checking for.
    attr_reader :name
    # @return [String] This is the description of the eval.
    #  This helps describe the eval and its purpose in detail. It will not be used to
    #  evaluate the flow of the conversation.
    attr_reader :description
    # @return [Vapi::EvalUserEditableType] This is the type of the eval.
    #  Currently it is fixed to `chat.mockConversation`.
    attr_reader :type
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::EvalUserEditableMessagesItem>] This is the mock conversation that will be used to evaluate the flow of the
    #  conversation.
    #  Mock Messages are used to simulate the flow of the conversation
    #  Evaluation Messages are used as checkpoints in the flow where the model's
    #  response to previous conversation needs to be evaluated to check the content and
    #  tool calls
    # @param name [String] This is the name of the eval.
    #  It helps identify what the eval is checking for.
    # @param description [String] This is the description of the eval.
    #  This helps describe the eval and its purpose in detail. It will not be used to
    #  evaluate the flow of the conversation.
    # @param type [Vapi::EvalUserEditableType] This is the type of the eval.
    #  Currently it is fixed to `chat.mockConversation`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::EvalUserEditable]
    def initialize(messages:, type:, name: OMIT, description: OMIT, additional_properties: nil)
      @messages = messages
      @name = name if name != OMIT
      @description = description if description != OMIT
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "messages": messages, "name": name, "description": description, "type": type }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of EvalUserEditable
    #
    # @param json_object [String]
    # @return [Vapi::EvalUserEditable]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::EvalUserEditableMessagesItem.from_json(json_object: item)
      end
      name = parsed_json["name"]
      description = parsed_json["description"]
      type = parsed_json["type"]
      new(
        messages: messages,
        name: name,
        description: description,
        type: type,
        additional_properties: struct
      )
    end

    # Serialize an instance of EvalUserEditable to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.type.is_a?(Vapi::EvalUserEditableType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end
