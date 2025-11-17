# frozen_string_literal: true

require "json"
require_relative "../../types/chat_eval_assistant_message_mock"
require_relative "../../types/chat_eval_system_message_mock"
require_relative "../../types/chat_eval_tool_response_message_mock"
require_relative "../../types/chat_eval_tool_response_message_evaluation"
require_relative "../../types/chat_eval_user_message_mock"
require_relative "../../types/chat_eval_assistant_message_evaluation"

module Vapi
  class Eval
    class UpdateEvalDtoMessagesItem
      # Deserialize a JSON object to an instance of UpdateEvalDtoMessagesItem
      #
      # @param json_object [String]
      # @return [Vapi::Eval::UpdateEvalDtoMessagesItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Vapi::ChatEvalAssistantMessageMock.validate_raw(obj: struct)
          return Vapi::ChatEvalAssistantMessageMock.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::ChatEvalSystemMessageMock.validate_raw(obj: struct)
          return Vapi::ChatEvalSystemMessageMock.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::ChatEvalToolResponseMessageMock.validate_raw(obj: struct)
          return Vapi::ChatEvalToolResponseMessageMock.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::ChatEvalToolResponseMessageEvaluation.validate_raw(obj: struct)
          return Vapi::ChatEvalToolResponseMessageEvaluation.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::ChatEvalUserMessageMock.validate_raw(obj: struct)
          return Vapi::ChatEvalUserMessageMock.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::ChatEvalAssistantMessageEvaluation.validate_raw(obj: struct)
          return Vapi::ChatEvalAssistantMessageEvaluation.from_json(json_object: struct) unless struct.nil?

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
          return Vapi::ChatEvalAssistantMessageMock.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::ChatEvalSystemMessageMock.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::ChatEvalToolResponseMessageMock.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::ChatEvalToolResponseMessageEvaluation.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::ChatEvalUserMessageMock.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::ChatEvalAssistantMessageEvaluation.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
