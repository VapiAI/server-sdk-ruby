# frozen_string_literal: true

require "json"
require_relative "../../types/call"
require_relative "../../types/call_batch_response"

module Vapi
  class Calls
    class CallsCreateResponse
      # Deserialize a JSON object to an instance of CallsCreateResponse
      #
      # @param json_object [String]
      # @return [Vapi::Calls::CallsCreateResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Vapi::Call.validate_raw(obj: struct)
          return Vapi::Call.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::CallBatchResponse.validate_raw(obj: struct)
          return Vapi::CallBatchResponse.from_json(json_object: struct) unless struct.nil?

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
          return Vapi::Call.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::CallBatchResponse.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
