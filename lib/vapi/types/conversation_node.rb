# frozen_string_literal: true

module Vapi
  module Types
    class ConversationNode < Internal::Types::Model
      field :model, -> { Vapi::Types::ConversationNodeModel }, optional: true, nullable: false
      field :transcriber, -> { Vapi::Types::ConversationNodeTranscriber }, optional: true, nullable: false
      field :voice, -> { Vapi::Types::ConversationNodeVoice }, optional: true, nullable: false
      field :tools, -> { Internal::Types::Array[Vapi::Types::ConversationNodeToolsItem] }, optional: true, nullable: false
      field :tool_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "toolIds"
      field :prompt, -> { String }, optional: true, nullable: false
      field :global_node_plan, -> { Vapi::Types::GlobalNodePlan }, optional: true, nullable: false, api_name: "globalNodePlan"
      field :variable_extraction_plan, -> { Vapi::Types::VariableExtractionPlan }, optional: true, nullable: false, api_name: "variableExtractionPlan"
      field :name, -> { String }, optional: false, nullable: false
      field :is_start, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isStart"
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
