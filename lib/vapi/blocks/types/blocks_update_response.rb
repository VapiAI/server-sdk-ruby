# frozen_string_literal: true

require "json"
require_relative "../../types/conversation_block"
require_relative "../../types/tool_call_block"
require_relative "../../types/workflow_block"

module Vapi
  class Blocks
    class BlocksUpdateResponse
      # Deserialize a JSON object to an instance of BlocksUpdateResponse
      #
      # @param json_object [String]
      # @return [Vapi::Blocks::BlocksUpdateResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Vapi::ConversationBlock.validate_raw(obj: struct)
          return Vapi::ConversationBlock.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::ToolCallBlock.validate_raw(obj: struct)
          return Vapi::ToolCallBlock.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::WorkflowBlock.validate_raw(obj: struct)
          return Vapi::WorkflowBlock.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        struct
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Vapi::ConversationBlock.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::ToolCallBlock.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::WorkflowBlock.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
