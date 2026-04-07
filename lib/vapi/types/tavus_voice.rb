# frozen_string_literal: true

module Vapi
  module Types
    class TavusVoice < Internal::Types::Model
      field :caching_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cachingEnabled"
      field :voice_id, -> { Vapi::Types::TavusVoiceVoiceId }, optional: false, nullable: false, api_name: "voiceId"
      field :chunk_plan, -> { Vapi::Types::ChunkPlan }, optional: true, nullable: false, api_name: "chunkPlan"
      field :persona_id, -> { String }, optional: true, nullable: false, api_name: "personaId"
      field :callback_url, -> { String }, optional: true, nullable: false, api_name: "callbackUrl"
      field :conversation_name, -> { String }, optional: true, nullable: false, api_name: "conversationName"
      field :conversational_context, -> { String }, optional: true, nullable: false, api_name: "conversationalContext"
      field :custom_greeting, -> { String }, optional: true, nullable: false, api_name: "customGreeting"
      field :properties, -> { Vapi::Types::TavusConversationProperties }, optional: true, nullable: false
      field :fallback_plan, -> { Vapi::Types::FallbackPlan }, optional: true, nullable: false, api_name: "fallbackPlan"
    end
  end
end
