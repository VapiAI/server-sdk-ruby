# frozen_string_literal: true

require "json"
require_relative "../../types/update_conversation_block_dto"
require_relative "../../types/update_tool_call_block_dto"
require_relative "../../types/update_workflow_block_dto"

module Vapi
  class Blocks
    class BlocksUpdateRequest
      # @return [Object]
      attr_reader :member
      # @return [String]
      attr_reader :discriminant

      private_class_method :new
      alias kind_of? is_a?

      # @param member [Object]
      # @param discriminant [String]
      # @return [Vapi::Blocks::BlocksUpdateRequest]
      def initialize(member:, discriminant:)
        @member = member
        @discriminant = discriminant
      end

      # Deserialize a JSON object to an instance of BlocksUpdateRequest
      #
      # @param json_object [String]
      # @return [Vapi::Blocks::BlocksUpdateRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        member = case struct.type
                 when "conversation"
                   Vapi::UpdateConversationBlockDto.from_json(json_object: json_object)
                 when "tool-call"
                   Vapi::UpdateToolCallBlockDto.from_json(json_object: json_object)
                 when "workflow"
                   Vapi::UpdateWorkflowBlockDto.from_json(json_object: json_object)
                 else
                   Vapi::UpdateConversationBlockDto.from_json(json_object: json_object)
                 end
        new(member: member, discriminant: struct.type)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [String]
      def to_json(*_args)
        case @discriminant
        when "conversation"
          { **@member.to_json, type: @discriminant }.to_json
        when "tool-call"
          { **@member.to_json, type: @discriminant }.to_json
        when "workflow"
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
          Vapi::UpdateConversationBlockDto.validate_raw(obj: obj)
        when "tool-call"
          Vapi::UpdateToolCallBlockDto.validate_raw(obj: obj)
        when "workflow"
          Vapi::UpdateWorkflowBlockDto.validate_raw(obj: obj)
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

      # @param member [Vapi::UpdateConversationBlockDto]
      # @return [Vapi::Blocks::BlocksUpdateRequest]
      def self.conversation(member:)
        new(member: member, discriminant: "conversation")
      end

      # @param member [Vapi::UpdateToolCallBlockDto]
      # @return [Vapi::Blocks::BlocksUpdateRequest]
      def self.tool_call(member:)
        new(member: member, discriminant: "tool-call")
      end

      # @param member [Vapi::UpdateWorkflowBlockDto]
      # @return [Vapi::Blocks::BlocksUpdateRequest]
      def self.workflow(member:)
        new(member: member, discriminant: "workflow")
      end
    end
  end
end
