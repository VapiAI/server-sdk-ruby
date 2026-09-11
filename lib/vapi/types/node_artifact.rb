# frozen_string_literal: true

module Vapi
  module Types
    # Messages and variable values captured while a workflow node was active.
    class NodeArtifact < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::NodeArtifactMessagesItem] }, optional: true, nullable: false
      field :node_name, -> { String }, optional: true, nullable: false, api_name: "nodeName"
      field :variable_values, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "variableValues"
    end
  end
end
