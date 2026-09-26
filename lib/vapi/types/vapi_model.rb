# frozen_string_literal: true

module Vapi
  module Types
    class VapiModel < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::OpenAiMessage] }, optional: true, nullable: false
      field :tools, -> { Internal::Types::Array[Vapi::Types::VapiModelToolsItem] }, optional: true, nullable: false
      field :tool_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "toolIds"
      field :tool_refs, -> { Internal::Types::Array[Vapi::Types::ToolRef] }, optional: true, nullable: false, api_name: "toolRefs"
      field :knowledge_base, -> { Vapi::Types::CreateCustomKnowledgeBaseDto }, optional: true, nullable: false, api_name: "knowledgeBase"
      field :model, -> { String }, optional: true, nullable: false
      field :version, -> { Vapi::Types::VapiModelVersion }, optional: true, nullable: false
      field :workflow_id, -> { String }, optional: true, nullable: false, api_name: "workflowId"
      field :workflow, -> { Vapi::Types::WorkflowUserEditable }, optional: true, nullable: false
      field :temperature, -> { Integer }, optional: true, nullable: false
      field :emotion_recognition_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "emotionRecognitionEnabled"
      field :num_fast_turns, -> { Integer }, optional: true, nullable: false, api_name: "numFastTurns"
    end
  end
end
