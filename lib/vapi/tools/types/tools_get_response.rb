# frozen_string_literal: true

require "json"
require_relative "../../types/dtmf_tool"
require_relative "../../types/end_call_tool"
require_relative "../../types/function_tool"
require_relative "../../types/ghl_tool"
require_relative "../../types/make_tool"
require_relative "../../types/transfer_call_tool"
require_relative "../../types/output_tool"

module Vapi
  class Tools
    class ToolsGetResponse
      # Deserialize a JSON object to an instance of ToolsGetResponse
      #
      # @param json_object [String]
      # @return [Vapi::Tools::ToolsGetResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Vapi::DtmfTool.validate_raw(obj: struct)
          return Vapi::DtmfTool.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::EndCallTool.validate_raw(obj: struct)
          return Vapi::EndCallTool.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::FunctionTool.validate_raw(obj: struct)
          return Vapi::FunctionTool.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::GhlTool.validate_raw(obj: struct)
          return Vapi::GhlTool.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::MakeTool.validate_raw(obj: struct)
          return Vapi::MakeTool.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::TransferCallTool.validate_raw(obj: struct)
          return Vapi::TransferCallTool.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::OutputTool.validate_raw(obj: struct)
          return Vapi::OutputTool.from_json(json_object: struct) unless struct.nil?

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
          return Vapi::DtmfTool.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::EndCallTool.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::FunctionTool.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::GhlTool.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::MakeTool.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::TransferCallTool.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::OutputTool.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
