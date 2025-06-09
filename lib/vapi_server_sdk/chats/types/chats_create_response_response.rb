# frozen_string_literal: true
require "json"
require_relative "../../types/response_object"
require_relative "../../types/response_text_delta_event"
require_relative "../../types/response_text_done_event"
require_relative "../../types/response_completed_event"
require_relative "../../types/response_error_event"

module Vapi
  module Chats
    class ChatsCreateResponseResponse


# Deserialize a JSON object to an instance of ChatsCreateResponseResponse
      #
      # @param json_object [String] 
      # @return [Vapi::Chats::ChatsCreateResponseResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Vapi::ResponseObject.validate_raw(obj: struct)
          unless struct.nil?
  return Vapi::ResponseObject.from_json(json_object: struct)
else
  return nil
end
        rescue StandardError
          # noop
        end
        begin
          Vapi::ResponseTextDeltaEvent.validate_raw(obj: struct)
          unless struct.nil?
  return Vapi::ResponseTextDeltaEvent.from_json(json_object: struct)
else
  return nil
end
        rescue StandardError
          # noop
        end
        begin
          Vapi::ResponseTextDoneEvent.validate_raw(obj: struct)
          unless struct.nil?
  return Vapi::ResponseTextDoneEvent.from_json(json_object: struct)
else
  return nil
end
        rescue StandardError
          # noop
        end
        begin
          Vapi::ResponseCompletedEvent.validate_raw(obj: struct)
          unless struct.nil?
  return Vapi::ResponseCompletedEvent.from_json(json_object: struct)
else
  return nil
end
        rescue StandardError
          # noop
        end
        begin
          Vapi::ResponseErrorEvent.validate_raw(obj: struct)
          unless struct.nil?
  return Vapi::ResponseErrorEvent.from_json(json_object: struct)
else
  return nil
end
        rescue StandardError
          # noop
        end
 return struct
      end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Vapi::ResponseObject.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::ResponseTextDeltaEvent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::ResponseTextDoneEvent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::ResponseCompletedEvent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::ResponseErrorEvent.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end