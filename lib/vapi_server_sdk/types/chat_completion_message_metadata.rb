# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ChatCompletionMessageMetadata
    # @return [String]
    attr_reader :task_name
    # @return [String]
    attr_reader :task_type
    # @return [String]
    attr_reader :task_output
    # @return [Hash{String => Object}]
    attr_reader :task_state
    # @return [Array<String>]
    attr_reader :node_trace
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param task_name [String]
    # @param task_type [String]
    # @param task_output [String]
    # @param task_state [Hash{String => Object}]
    # @param node_trace [Array<String>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ChatCompletionMessageMetadata]
    def initialize(task_name:, task_type:, task_output:, task_state: OMIT, node_trace: OMIT, additional_properties: nil)
      @task_name = task_name
      @task_type = task_type
      @task_output = task_output
      @task_state = task_state if task_state != OMIT
      @node_trace = node_trace if node_trace != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "taskName": task_name,
        "taskType": task_type,
        "taskOutput": task_output,
        "taskState": task_state,
        "nodeTrace": node_trace
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ChatCompletionMessageMetadata
    #
    # @param json_object [String]
    # @return [Vapi::ChatCompletionMessageMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      task_name = parsed_json["taskName"]
      task_type = parsed_json["taskType"]
      task_output = parsed_json["taskOutput"]
      task_state = parsed_json["taskState"]
      node_trace = parsed_json["nodeTrace"]
      new(
        task_name: task_name,
        task_type: task_type,
        task_output: task_output,
        task_state: task_state,
        node_trace: node_trace,
        additional_properties: struct
      )
    end

    # Serialize an instance of ChatCompletionMessageMetadata to a JSON object
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
      obj.task_name.is_a?(String) != false || raise("Passed value for field obj.task_name is not the expected type, validation failed.")
      obj.task_type.is_a?(String) != false || raise("Passed value for field obj.task_type is not the expected type, validation failed.")
      obj.task_output.is_a?(String) != false || raise("Passed value for field obj.task_output is not the expected type, validation failed.")
      obj.task_state&.is_a?(Hash) != false || raise("Passed value for field obj.task_state is not the expected type, validation failed.")
      obj.node_trace&.is_a?(Array) != false || raise("Passed value for field obj.node_trace is not the expected type, validation failed.")
    end
  end
end
