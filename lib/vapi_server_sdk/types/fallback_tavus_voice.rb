# frozen_string_literal: true

require_relative "fallback_tavus_voice_voice_id"
require_relative "tavus_conversation_properties"
require_relative "chunk_plan"
require "ostruct"
require "json"

module Vapi
  class FallbackTavusVoice
    # @return [Vapi::FallbackTavusVoiceVoiceId] This is the provider-specific ID that will be used.
    attr_reader :voice_id
    # @return [String] This is the unique identifier for the persona that the replica will use in the
    #  conversation.
    attr_reader :persona_id
    # @return [String] This is the url that will receive webhooks with updates regarding the
    #  conversation state.
    attr_reader :callback_url
    # @return [String] This is the name for the conversation.
    attr_reader :conversation_name
    # @return [String] This is the context that will be appended to any context provided in the
    #  persona, if one is provided.
    attr_reader :conversational_context
    # @return [String] This is the custom greeting that the replica will give once a participant joines
    #  the conversation.
    attr_reader :custom_greeting
    # @return [Vapi::TavusConversationProperties] These are optional properties used to customize the conversation.
    attr_reader :properties
    # @return [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    attr_reader :chunk_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param voice_id [Vapi::FallbackTavusVoiceVoiceId] This is the provider-specific ID that will be used.
    # @param persona_id [String] This is the unique identifier for the persona that the replica will use in the
    #  conversation.
    # @param callback_url [String] This is the url that will receive webhooks with updates regarding the
    #  conversation state.
    # @param conversation_name [String] This is the name for the conversation.
    # @param conversational_context [String] This is the context that will be appended to any context provided in the
    #  persona, if one is provided.
    # @param custom_greeting [String] This is the custom greeting that the replica will give once a participant joines
    #  the conversation.
    # @param properties [Vapi::TavusConversationProperties] These are optional properties used to customize the conversation.
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FallbackTavusVoice]
    def initialize(voice_id:, persona_id: OMIT, callback_url: OMIT, conversation_name: OMIT,
                   conversational_context: OMIT, custom_greeting: OMIT, properties: OMIT, chunk_plan: OMIT, additional_properties: nil)
      @voice_id = voice_id
      @persona_id = persona_id if persona_id != OMIT
      @callback_url = callback_url if callback_url != OMIT
      @conversation_name = conversation_name if conversation_name != OMIT
      @conversational_context = conversational_context if conversational_context != OMIT
      @custom_greeting = custom_greeting if custom_greeting != OMIT
      @properties = properties if properties != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "voiceId": voice_id,
        "personaId": persona_id,
        "callbackUrl": callback_url,
        "conversationName": conversation_name,
        "conversationalContext": conversational_context,
        "customGreeting": custom_greeting,
        "properties": properties,
        "chunkPlan": chunk_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FallbackTavusVoice
    #
    # @param json_object [String]
    # @return [Vapi::FallbackTavusVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["voiceId"].nil?
        voice_id = nil
      else
        voice_id = parsed_json["voiceId"].to_json
        voice_id = Vapi::FallbackTavusVoiceVoiceId.from_json(json_object: voice_id)
      end
      persona_id = parsed_json["personaId"]
      callback_url = parsed_json["callbackUrl"]
      conversation_name = parsed_json["conversationName"]
      conversational_context = parsed_json["conversationalContext"]
      custom_greeting = parsed_json["customGreeting"]
      if parsed_json["properties"].nil?
        properties = nil
      else
        properties = parsed_json["properties"].to_json
        properties = Vapi::TavusConversationProperties.from_json(json_object: properties)
      end
      if parsed_json["chunkPlan"].nil?
        chunk_plan = nil
      else
        chunk_plan = parsed_json["chunkPlan"].to_json
        chunk_plan = Vapi::ChunkPlan.from_json(json_object: chunk_plan)
      end
      new(
        voice_id: voice_id,
        persona_id: persona_id,
        callback_url: callback_url,
        conversation_name: conversation_name,
        conversational_context: conversational_context,
        custom_greeting: custom_greeting,
        properties: properties,
        chunk_plan: chunk_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of FallbackTavusVoice to a JSON object
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
      Vapi::FallbackTavusVoiceVoiceId.validate_raw(obj: obj.voice_id)
      obj.persona_id&.is_a?(String) != false || raise("Passed value for field obj.persona_id is not the expected type, validation failed.")
      obj.callback_url&.is_a?(String) != false || raise("Passed value for field obj.callback_url is not the expected type, validation failed.")
      obj.conversation_name&.is_a?(String) != false || raise("Passed value for field obj.conversation_name is not the expected type, validation failed.")
      obj.conversational_context&.is_a?(String) != false || raise("Passed value for field obj.conversational_context is not the expected type, validation failed.")
      obj.custom_greeting&.is_a?(String) != false || raise("Passed value for field obj.custom_greeting is not the expected type, validation failed.")
      obj.properties.nil? || Vapi::TavusConversationProperties.validate_raw(obj: obj.properties)
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
    end
  end
end
