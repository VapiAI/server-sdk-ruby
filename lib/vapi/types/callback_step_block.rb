# frozen_string_literal: true

require "json"
require_relative "create_conversation_block_dto"
require_relative "create_tool_call_block_dto"
require_relative "create_workflow_block_dto"

module Vapi
  # This is the block to use. To use an existing block, use `blockId`.
  class CallbackStepBlock
    # Deserialize a JSON object to an instance of CallbackStepBlock
    #
    # @param json_object [String]
    # @return [Vapi::CallbackStepBlock]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::CreateConversationBlockDto.validate_raw(obj: struct)
        return Vapi::CreateConversationBlockDto.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::CreateToolCallBlockDto.validate_raw(obj: struct)
        return Vapi::CreateToolCallBlockDto.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::CreateWorkflowBlockDto.validate_raw(obj: struct)
        return Vapi::CreateWorkflowBlockDto.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::CreateConversationBlockDto.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CreateToolCallBlockDto.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CreateWorkflowBlockDto.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
