# frozen_string_literal: true

require_relative "chat_completion_message"
require_relative "create_workflow_dto"
require "ostruct"
require "json"

module Vapi
  class ChatCompletionsDto
    # @return [Array<Vapi::ChatCompletionMessage>]
    attr_reader :messages
    # @return [String]
    attr_reader :workflow_id
    # @return [Vapi::CreateWorkflowDto]
    attr_reader :workflow
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::ChatCompletionMessage>]
    # @param workflow_id [String]
    # @param workflow [Vapi::CreateWorkflowDto]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ChatCompletionsDto]
    def initialize(messages:, workflow_id: OMIT, workflow: OMIT, additional_properties: nil)
      @messages = messages
      @workflow_id = workflow_id if workflow_id != OMIT
      @workflow = workflow if workflow != OMIT
      @additional_properties = additional_properties
      @_field_set = { "messages": messages, "workflowId": workflow_id, "workflow": workflow }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ChatCompletionsDto
    #
    # @param json_object [String]
    # @return [Vapi::ChatCompletionsDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::ChatCompletionMessage.from_json(json_object: item)
      end
      workflow_id = parsed_json["workflowId"]
      if parsed_json["workflow"].nil?
        workflow = nil
      else
        workflow = parsed_json["workflow"].to_json
        workflow = Vapi::CreateWorkflowDto.from_json(json_object: workflow)
      end
      new(
        messages: messages,
        workflow_id: workflow_id,
        workflow: workflow,
        additional_properties: struct
      )
    end

    # Serialize an instance of ChatCompletionsDto to a JSON object
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
      obj.workflow_id&.is_a?(String) != false || raise("Passed value for field obj.workflow_id is not the expected type, validation failed.")
      obj.workflow.nil? || Vapi::CreateWorkflowDto.validate_raw(obj: obj.workflow)
    end
  end
end
