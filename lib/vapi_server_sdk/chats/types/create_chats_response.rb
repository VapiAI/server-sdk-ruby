# frozen_string_literal: true

require "json"
require_relative "../../types/chat"
require_relative "../../types/create_chat_stream_response"

module Vapi
  class Chats
    class CreateChatsResponse
      # Deserialize a JSON object to an instance of CreateChatsResponse
      #
      # @param json_object [String]
      # @return [Vapi::Chats::CreateChatsResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Vapi::Chat.validate_raw(obj: struct)
          return Vapi::Chat.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::CreateChatStreamResponse.validate_raw(obj: struct)
          return Vapi::CreateChatStreamResponse.from_json(json_object: struct) unless struct.nil?

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
          return Vapi::Chat.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::CreateChatStreamResponse.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
