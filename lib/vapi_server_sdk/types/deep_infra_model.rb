# frozen_string_literal: true
require_relative "open_ai_message"
require_relative "deep_infra_model_tools_item"
require_relative "create_custom_knowledge_base_dto"
require "ostruct"
require "json"

module Vapi
  class DeepInfraModel
  # @return [Array<Vapi::OpenAiMessage>] This is the starting state for the conversation.
    attr_reader :messages
  # @return [Array<Vapi::DeepInfraModelToolsItem>] These are the tools that the assistant can use during the call. To use existing
#  tools, use `toolIds`.
#  Both `tools` and `toolIds` can be used together.
    attr_reader :tools
  # @return [Array<String>] These are the tools that the assistant can use during the call. To use transient
#  tools, use `tools`.
#  Both `tools` and `toolIds` can be used together.
    attr_reader :tool_ids
  # @return [Vapi::CreateCustomKnowledgeBaseDto] These are the options for the knowledge base.
    attr_reader :knowledge_base
  # @return [String] This is the ID of the knowledge base the model will use.
    attr_reader :knowledge_base_id
  # @return [String] This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
    attr_reader :model
  # @return [Float] This is the temperature that will be used for calls. Default is 0 to leverage
#  caching for lower latency.
    attr_reader :temperature
  # @return [Float] This is the max number of tokens that the assistant will be allowed to generate
#  in each turn of the conversation. Default is 250.
    attr_reader :max_tokens
  # @return [Boolean] This determines whether we detect user's emotion while they speak and send it as
#  an additional info to model.
#  Default `false` because the model is usually are good at understanding the
#  user's emotion from text.
#  @default false
    attr_reader :emotion_recognition_enabled
  # @return [Float] This sets how many turns at the start of the conversation to use a smaller,
#  faster model from the same provider before switching to the primary model.
#  Example, gpt-3.5-turbo if provider is openai.
#  Default is 0.
#  @default 0
    attr_reader :num_fast_turns
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::OpenAiMessage>] This is the starting state for the conversation.
    # @param tools [Array<Vapi::DeepInfraModelToolsItem>] These are the tools that the assistant can use during the call. To use existing
#  tools, use `toolIds`.
#  Both `tools` and `toolIds` can be used together.
    # @param tool_ids [Array<String>] These are the tools that the assistant can use during the call. To use transient
#  tools, use `tools`.
#  Both `tools` and `toolIds` can be used together.
    # @param knowledge_base [Vapi::CreateCustomKnowledgeBaseDto] These are the options for the knowledge base.
    # @param knowledge_base_id [String] This is the ID of the knowledge base the model will use.
    # @param model [String] This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
    # @param temperature [Float] This is the temperature that will be used for calls. Default is 0 to leverage
#  caching for lower latency.
    # @param max_tokens [Float] This is the max number of tokens that the assistant will be allowed to generate
#  in each turn of the conversation. Default is 250.
    # @param emotion_recognition_enabled [Boolean] This determines whether we detect user's emotion while they speak and send it as
#  an additional info to model.
#  Default `false` because the model is usually are good at understanding the
#  user's emotion from text.
#  @default false
    # @param num_fast_turns [Float] This sets how many turns at the start of the conversation to use a smaller,
#  faster model from the same provider before switching to the primary model.
#  Example, gpt-3.5-turbo if provider is openai.
#  Default is 0.
#  @default 0
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::DeepInfraModel]
    def initialize(messages: OMIT, tools: OMIT, tool_ids: OMIT, knowledge_base: OMIT, knowledge_base_id: OMIT, model:, temperature: OMIT, max_tokens: OMIT, emotion_recognition_enabled: OMIT, num_fast_turns: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @tools = tools if tools != OMIT
      @tool_ids = tool_ids if tool_ids != OMIT
      @knowledge_base = knowledge_base if knowledge_base != OMIT
      @knowledge_base_id = knowledge_base_id if knowledge_base_id != OMIT
      @model = model
      @temperature = temperature if temperature != OMIT
      @max_tokens = max_tokens if max_tokens != OMIT
      @emotion_recognition_enabled = emotion_recognition_enabled if emotion_recognition_enabled != OMIT
      @num_fast_turns = num_fast_turns if num_fast_turns != OMIT
      @additional_properties = additional_properties
      @_field_set = { "messages": messages, "tools": tools, "toolIds": tool_ids, "knowledgeBase": knowledge_base, "knowledgeBaseId": knowledge_base_id, "model": model, "temperature": temperature, "maxTokens": max_tokens, "emotionRecognitionEnabled": emotion_recognition_enabled, "numFastTurns": num_fast_turns }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeepInfraModel
    #
    # @param json_object [String] 
    # @return [Vapi::DeepInfraModel]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do | item |
  item = item.to_json
  Vapi::OpenAiMessage.from_json(json_object: item)
end
      tools = parsed_json["tools"]&.map do | item |
  item = item.to_json
  Vapi::DeepInfraModelToolsItem.from_json(json_object: item)
end
      tool_ids = parsed_json["toolIds"]
      unless parsed_json["knowledgeBase"].nil?
        knowledge_base = parsed_json["knowledgeBase"].to_json
        knowledge_base = Vapi::CreateCustomKnowledgeBaseDto.from_json(json_object: knowledge_base)
      else
        knowledge_base = nil
      end
      knowledge_base_id = parsed_json["knowledgeBaseId"]
      model = parsed_json["model"]
      temperature = parsed_json["temperature"]
      max_tokens = parsed_json["maxTokens"]
      emotion_recognition_enabled = parsed_json["emotionRecognitionEnabled"]
      num_fast_turns = parsed_json["numFastTurns"]
      new(
        messages: messages,
        tools: tools,
        tool_ids: tool_ids,
        knowledge_base: knowledge_base,
        knowledge_base_id: knowledge_base_id,
        model: model,
        temperature: temperature,
        max_tokens: max_tokens,
        emotion_recognition_enabled: emotion_recognition_enabled,
        num_fast_turns: num_fast_turns,
        additional_properties: struct
      )
    end
# Serialize an instance of DeepInfraModel to a JSON object
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
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.tools&.is_a?(Array) != false || raise("Passed value for field obj.tools is not the expected type, validation failed.")
      obj.tool_ids&.is_a?(Array) != false || raise("Passed value for field obj.tool_ids is not the expected type, validation failed.")
      obj.knowledge_base.nil? || Vapi::CreateCustomKnowledgeBaseDto.validate_raw(obj: obj.knowledge_base)
      obj.knowledge_base_id&.is_a?(String) != false || raise("Passed value for field obj.knowledge_base_id is not the expected type, validation failed.")
      obj.model.is_a?(String) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.temperature&.is_a?(Float) != false || raise("Passed value for field obj.temperature is not the expected type, validation failed.")
      obj.max_tokens&.is_a?(Float) != false || raise("Passed value for field obj.max_tokens is not the expected type, validation failed.")
      obj.emotion_recognition_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.emotion_recognition_enabled is not the expected type, validation failed.")
      obj.num_fast_turns&.is_a?(Float) != false || raise("Passed value for field obj.num_fast_turns is not the expected type, validation failed.")
    end
  end
end