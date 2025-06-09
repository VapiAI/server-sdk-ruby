# frozen_string_literal: true
require "json"
require_relative "../../types/conversation_node"
require_relative "../../types/tool_node"

module Vapi
  module Workflow
    class UpdateWorkflowDtoNodesItem
    # @return [Object] 
      attr_reader :member
    # @return [String] 
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object] 
      # @param discriminant [String] 
      # @return [Vapi::Workflow::UpdateWorkflowDtoNodesItem]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end
# Deserialize a JSON object to an instance of UpdateWorkflowDtoNodesItem
      #
      # @param json_object [String] 
      # @return [Vapi::Workflow::UpdateWorkflowDtoNodesItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        case struct.type
        when "conversation"
          member = Vapi::ConversationNode.from_json(json_object: json_object)
        when "tool"
          member = Vapi::ToolNode.from_json(json_object: json_object)
        else
          member = Vapi::ConversationNode.from_json(json_object: json_object)
        end
        new(member: member, discriminant: struct.type)
      end
# For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [String]
      def to_json
        case @discriminant
        when "conversation"
          { **@member.to_json, type: @discriminant }.to_json
        when "tool"
          { **@member.to_json, type: @discriminant }.to_json
        else
          { "type": @discriminant, value: @member }.to_json
        end
        @member.to_json
      end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        case obj.type
        when "conversation"
          Vapi::ConversationNode.validate_raw(obj: obj)
        when "tool"
          Vapi::ToolNode.validate_raw(obj: obj)
        else
          raise("Passed value matched no type within the union, validation failed.")
        end
      end
# For Union Types, is_a? functionality is delegated to the wrapped member.
      #
      # @param obj [Object] 
      # @return [Boolean]
      def is_a?(obj)
        @member.is_a?(obj)
      end
      # @param member [Vapi::ConversationNode] 
      # @return [Vapi::Workflow::UpdateWorkflowDtoNodesItem]
      def self.conversation(member:)
        new(member: member, discriminant: "conversation")
      end
      # @param member [Vapi::ToolNode] 
      # @return [Vapi::Workflow::UpdateWorkflowDtoNodesItem]
      def self.tool(member:)
        new(member: member, discriminant: "tool")
      end
    end
  end
end