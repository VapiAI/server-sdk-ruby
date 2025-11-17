# frozen_string_literal: true

require_relative "conversation_node_model"
require_relative "conversation_node_transcriber"
require_relative "conversation_node_voice"
require_relative "conversation_node_tools_item"
require_relative "global_node_plan"
require_relative "variable_extraction_plan"
require "ostruct"
require "json"

module Vapi
  class ConversationNode
    # @return [Vapi::ConversationNodeModel] This is the model for the node.
    #  This overrides `workflow.model`.
    attr_reader :model
    # @return [Vapi::ConversationNodeTranscriber] This is the transcriber for the node.
    #  This overrides `workflow.transcriber`.
    attr_reader :transcriber
    # @return [Vapi::ConversationNodeVoice] This is the voice for the node.
    #  This overrides `workflow.voice`.
    attr_reader :voice
    # @return [Array<Vapi::ConversationNodeToolsItem>] These are the tools that the conversation node can use during the call. To use
    #  existing tools, use `toolIds`.
    #  Both `tools` and `toolIds` can be used together.
    attr_reader :tools
    # @return [Array<String>] These are the tools that the conversation node can use during the call. To use
    #  transient tools, use `tools`.
    #  Both `tools` and `toolIds` can be used together.
    attr_reader :tool_ids
    # @return [String]
    attr_reader :prompt
    # @return [Vapi::GlobalNodePlan] This is the plan for the global node.
    attr_reader :global_node_plan
    # @return [Vapi::VariableExtractionPlan] This is the plan that controls the variable extraction from the user's
    #  responses.
    #  Usage:
    #  Use `schema` to specify what you want to extract from the user's responses.
    #  ```json
    #  {
    #  "schema": {
    #  "type": "object",
    #  "properties": {
    #  "user": {
    #  "type": "object",
    #  "properties": {
    #  "name": {
    #  "type": "string"
    #  },
    #  "age": {
    #  "type": "number"
    #  }
    #  }
    #  }
    #  }
    #  }
    #  }
    #  ```
    #  This will be extracted as `{{ user.name }}` and `{{ user.age }}` respectively.
    #  (Optional) Use `aliases` to create new variables.
    #  ```json
    #  {
    #  "aliases": [
    #  {
    #  "key": "userAge",
    #  "value": "{{user.age}}"
    #  },
    #  {
    #  "key": "userName",
    #  "value": "{{user.name}}"
    #  }
    #  ]
    #  }
    #  ```
    #  This will be extracted as `{{ userAge }}` and `{{ userName }}` respectively.
    #  Note: The `schema` field is required for Conversation nodes if you want to
    #  extract variables from the user's responses. `aliases` is just a convenience.
    attr_reader :variable_extraction_plan
    # @return [String]
    attr_reader :name
    # @return [Boolean] This is whether or not the node is the start of the workflow.
    attr_reader :is_start
    # @return [Hash{String => Object}] This is for metadata you want to store on the task.
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model [Vapi::ConversationNodeModel] This is the model for the node.
    #  This overrides `workflow.model`.
    # @param transcriber [Vapi::ConversationNodeTranscriber] This is the transcriber for the node.
    #  This overrides `workflow.transcriber`.
    # @param voice [Vapi::ConversationNodeVoice] This is the voice for the node.
    #  This overrides `workflow.voice`.
    # @param tools [Array<Vapi::ConversationNodeToolsItem>] These are the tools that the conversation node can use during the call. To use
    #  existing tools, use `toolIds`.
    #  Both `tools` and `toolIds` can be used together.
    # @param tool_ids [Array<String>] These are the tools that the conversation node can use during the call. To use
    #  transient tools, use `tools`.
    #  Both `tools` and `toolIds` can be used together.
    # @param prompt [String]
    # @param global_node_plan [Vapi::GlobalNodePlan] This is the plan for the global node.
    # @param variable_extraction_plan [Vapi::VariableExtractionPlan] This is the plan that controls the variable extraction from the user's
    #  responses.
    #  Usage:
    #  Use `schema` to specify what you want to extract from the user's responses.
    #  ```json
    #  {
    #  "schema": {
    #  "type": "object",
    #  "properties": {
    #  "user": {
    #  "type": "object",
    #  "properties": {
    #  "name": {
    #  "type": "string"
    #  },
    #  "age": {
    #  "type": "number"
    #  }
    #  }
    #  }
    #  }
    #  }
    #  }
    #  ```
    #  This will be extracted as `{{ user.name }}` and `{{ user.age }}` respectively.
    #  (Optional) Use `aliases` to create new variables.
    #  ```json
    #  {
    #  "aliases": [
    #  {
    #  "key": "userAge",
    #  "value": "{{user.age}}"
    #  },
    #  {
    #  "key": "userName",
    #  "value": "{{user.name}}"
    #  }
    #  ]
    #  }
    #  ```
    #  This will be extracted as `{{ userAge }}` and `{{ userName }}` respectively.
    #  Note: The `schema` field is required for Conversation nodes if you want to
    #  extract variables from the user's responses. `aliases` is just a convenience.
    # @param name [String]
    # @param is_start [Boolean] This is whether or not the node is the start of the workflow.
    # @param metadata [Hash{String => Object}] This is for metadata you want to store on the task.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ConversationNode]
    def initialize(name:, model: OMIT, transcriber: OMIT, voice: OMIT, tools: OMIT, tool_ids: OMIT, prompt: OMIT,
                   global_node_plan: OMIT, variable_extraction_plan: OMIT, is_start: OMIT, metadata: OMIT, additional_properties: nil)
      @model = model if model != OMIT
      @transcriber = transcriber if transcriber != OMIT
      @voice = voice if voice != OMIT
      @tools = tools if tools != OMIT
      @tool_ids = tool_ids if tool_ids != OMIT
      @prompt = prompt if prompt != OMIT
      @global_node_plan = global_node_plan if global_node_plan != OMIT
      @variable_extraction_plan = variable_extraction_plan if variable_extraction_plan != OMIT
      @name = name
      @is_start = is_start if is_start != OMIT
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "model": model,
        "transcriber": transcriber,
        "voice": voice,
        "tools": tools,
        "toolIds": tool_ids,
        "prompt": prompt,
        "globalNodePlan": global_node_plan,
        "variableExtractionPlan": variable_extraction_plan,
        "name": name,
        "isStart": is_start,
        "metadata": metadata
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ConversationNode
    #
    # @param json_object [String]
    # @return [Vapi::ConversationNode]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["model"].nil?
        model = nil
      else
        model = parsed_json["model"].to_json
        model = Vapi::ConversationNodeModel.from_json(json_object: model)
      end
      if parsed_json["transcriber"].nil?
        transcriber = nil
      else
        transcriber = parsed_json["transcriber"].to_json
        transcriber = Vapi::ConversationNodeTranscriber.from_json(json_object: transcriber)
      end
      if parsed_json["voice"].nil?
        voice = nil
      else
        voice = parsed_json["voice"].to_json
        voice = Vapi::ConversationNodeVoice.from_json(json_object: voice)
      end
      tools = parsed_json["tools"]&.map do |item|
        item = item.to_json
        Vapi::ConversationNodeToolsItem.from_json(json_object: item)
      end
      tool_ids = parsed_json["toolIds"]
      prompt = parsed_json["prompt"]
      if parsed_json["globalNodePlan"].nil?
        global_node_plan = nil
      else
        global_node_plan = parsed_json["globalNodePlan"].to_json
        global_node_plan = Vapi::GlobalNodePlan.from_json(json_object: global_node_plan)
      end
      if parsed_json["variableExtractionPlan"].nil?
        variable_extraction_plan = nil
      else
        variable_extraction_plan = parsed_json["variableExtractionPlan"].to_json
        variable_extraction_plan = Vapi::VariableExtractionPlan.from_json(json_object: variable_extraction_plan)
      end
      name = parsed_json["name"]
      is_start = parsed_json["isStart"]
      metadata = parsed_json["metadata"]
      new(
        model: model,
        transcriber: transcriber,
        voice: voice,
        tools: tools,
        tool_ids: tool_ids,
        prompt: prompt,
        global_node_plan: global_node_plan,
        variable_extraction_plan: variable_extraction_plan,
        name: name,
        is_start: is_start,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of ConversationNode to a JSON object
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
      obj.model.nil? || Vapi::ConversationNodeModel.validate_raw(obj: obj.model)
      obj.transcriber.nil? || Vapi::ConversationNodeTranscriber.validate_raw(obj: obj.transcriber)
      obj.voice.nil? || Vapi::ConversationNodeVoice.validate_raw(obj: obj.voice)
      obj.tools&.is_a?(Array) != false || raise("Passed value for field obj.tools is not the expected type, validation failed.")
      obj.tool_ids&.is_a?(Array) != false || raise("Passed value for field obj.tool_ids is not the expected type, validation failed.")
      obj.prompt&.is_a?(String) != false || raise("Passed value for field obj.prompt is not the expected type, validation failed.")
      obj.global_node_plan.nil? || Vapi::GlobalNodePlan.validate_raw(obj: obj.global_node_plan)
      obj.variable_extraction_plan.nil? || Vapi::VariableExtractionPlan.validate_raw(obj: obj.variable_extraction_plan)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.is_start&.is_a?(Boolean) != false || raise("Passed value for field obj.is_start is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
