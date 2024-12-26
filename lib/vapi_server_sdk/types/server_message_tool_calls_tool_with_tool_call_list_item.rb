# frozen_string_literal: true

require "json"
require_relative "function_tool_with_tool_call"
require_relative "ghl_tool_with_tool_call"
require_relative "make_tool_with_tool_call"

module Vapi
  class ServerMessageToolCallsToolWithToolCallListItem
    # Deserialize a JSON object to an instance of
    #  ServerMessageToolCallsToolWithToolCallListItem
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageToolCallsToolWithToolCallListItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::FunctionToolWithToolCall.validate_raw(obj: struct)
        return Vapi::FunctionToolWithToolCall.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::GhlToolWithToolCall.validate_raw(obj: struct)
        return Vapi::GhlToolWithToolCall.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::MakeToolWithToolCall.validate_raw(obj: struct)
        return Vapi::MakeToolWithToolCall.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        struct.is_a?(Object) != false || raise("Passed value for field struct is not the expected type, validation failed.")
        return struct unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        struct.is_a?(Object) != false || raise("Passed value for field struct is not the expected type, validation failed.")
        return struct unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        struct.is_a?(Object) != false || raise("Passed value for field struct is not the expected type, validation failed.")
        return struct unless struct.nil?

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
        return Vapi::FunctionToolWithToolCall.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::GhlToolWithToolCall.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::MakeToolWithToolCall.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return obj.is_a?(Object) != false || raise("Passed value for field obj is not the expected type, validation failed.")
      rescue StandardError
        # noop
      end
      begin
        return obj.is_a?(Object) != false || raise("Passed value for field obj is not the expected type, validation failed.")
      rescue StandardError
        # noop
      end
      begin
        return obj.is_a?(Object) != false || raise("Passed value for field obj is not the expected type, validation failed.")
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
