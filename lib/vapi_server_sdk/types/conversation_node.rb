# frozen_string_literal: true
require_relative "conversation_node_model"
require_relative "conversation_node_transcriber"
require_relative "conversation_node_voice"
require_relative "global_node_plan"
require_relative "variable_extraction_plan"
require "ostruct"
require "json"

module Vapi
  class ConversationNode
  # @return [Vapi::ConversationNodeModel] This is the model for the Conversation Task.
    attr_reader :model
  # @return [Vapi::ConversationNodeTranscriber] These are the options for the assistant's transcriber.
    attr_reader :transcriber
  # @return [Vapi::ConversationNodeVoice] These are the options for the assistant's voice.
    attr_reader :voice
  # @return [String] 
    attr_reader :prompt
  # @return [Vapi::GlobalNodePlan] This is the plan for the global node.
    attr_reader :global_node_plan
  # @return [Vapi::VariableExtractionPlan] This is the plan that controls the variable extraction from the user's response.
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

    # @param model [Vapi::ConversationNodeModel] This is the model for the Conversation Task.
    # @param transcriber [Vapi::ConversationNodeTranscriber] These are the options for the assistant's transcriber.
    # @param voice [Vapi::ConversationNodeVoice] These are the options for the assistant's voice.
    # @param prompt [String] 
    # @param global_node_plan [Vapi::GlobalNodePlan] This is the plan for the global node.
    # @param variable_extraction_plan [Vapi::VariableExtractionPlan] This is the plan that controls the variable extraction from the user's response.
    # @param name [String] 
    # @param is_start [Boolean] This is whether or not the node is the start of the workflow.
    # @param metadata [Hash{String => Object}] This is for metadata you want to store on the task.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ConversationNode]
    def initialize(model: OMIT, transcriber: OMIT, voice: OMIT, prompt: OMIT, global_node_plan: OMIT, variable_extraction_plan: OMIT, name:, is_start: OMIT, metadata: OMIT, additional_properties: nil)
      @model = model if model != OMIT
      @transcriber = transcriber if transcriber != OMIT
      @voice = voice if voice != OMIT
      @prompt = prompt if prompt != OMIT
      @global_node_plan = global_node_plan if global_node_plan != OMIT
      @variable_extraction_plan = variable_extraction_plan if variable_extraction_plan != OMIT
      @name = name
      @is_start = is_start if is_start != OMIT
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "model": model, "transcriber": transcriber, "voice": voice, "prompt": prompt, "globalNodePlan": global_node_plan, "variableExtractionPlan": variable_extraction_plan, "name": name, "isStart": is_start, "metadata": metadata }.reject do | _k, v |
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
      unless parsed_json["model"].nil?
        model = parsed_json["model"].to_json
        model = Vapi::ConversationNodeModel.from_json(json_object: model)
      else
        model = nil
      end
      unless parsed_json["transcriber"].nil?
        transcriber = parsed_json["transcriber"].to_json
        transcriber = Vapi::ConversationNodeTranscriber.from_json(json_object: transcriber)
      else
        transcriber = nil
      end
      unless parsed_json["voice"].nil?
        voice = parsed_json["voice"].to_json
        voice = Vapi::ConversationNodeVoice.from_json(json_object: voice)
      else
        voice = nil
      end
      prompt = parsed_json["prompt"]
      unless parsed_json["globalNodePlan"].nil?
        global_node_plan = parsed_json["globalNodePlan"].to_json
        global_node_plan = Vapi::GlobalNodePlan.from_json(json_object: global_node_plan)
      else
        global_node_plan = nil
      end
      unless parsed_json["variableExtractionPlan"].nil?
        variable_extraction_plan = parsed_json["variableExtractionPlan"].to_json
        variable_extraction_plan = Vapi::VariableExtractionPlan.from_json(json_object: variable_extraction_plan)
      else
        variable_extraction_plan = nil
      end
      name = parsed_json["name"]
      is_start = parsed_json["isStart"]
      metadata = parsed_json["metadata"]
      new(
        model: model,
        transcriber: transcriber,
        voice: voice,
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
      obj.model.nil? || Vapi::ConversationNodeModel.validate_raw(obj: obj.model)
      obj.transcriber.nil? || Vapi::ConversationNodeTranscriber.validate_raw(obj: obj.transcriber)
      obj.voice.nil? || Vapi::ConversationNodeVoice.validate_raw(obj: obj.voice)
      obj.prompt&.is_a?(String) != false || raise("Passed value for field obj.prompt is not the expected type, validation failed.")
      obj.global_node_plan.nil? || Vapi::GlobalNodePlan.validate_raw(obj: obj.global_node_plan)
      obj.variable_extraction_plan.nil? || Vapi::VariableExtractionPlan.validate_raw(obj: obj.variable_extraction_plan)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.is_start&.is_a?(Boolean) != false || raise("Passed value for field obj.is_start is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end