# frozen_string_literal: true

require "json"
require_relative "create_dtmf_tool_dto"
require_relative "create_end_call_tool_dto"
require_relative "create_voicemail_tool_dto"
require_relative "create_function_tool_dto"
require_relative "create_ghl_tool_dto"
require_relative "create_make_tool_dto"
require_relative "create_transfer_call_tool_dto"

module Vapi
  class OpenRouterModelToolsItem
    # Deserialize a JSON object to an instance of OpenRouterModelToolsItem
    #
    # @param json_object [String]
    # @return [Vapi::OpenRouterModelToolsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::CreateDtmfToolDto.validate_raw(obj: struct)
        return Vapi::CreateDtmfToolDto.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::CreateEndCallToolDto.validate_raw(obj: struct)
        return Vapi::CreateEndCallToolDto.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::CreateVoicemailToolDto.validate_raw(obj: struct)
        return Vapi::CreateVoicemailToolDto.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::CreateFunctionToolDto.validate_raw(obj: struct)
        return Vapi::CreateFunctionToolDto.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::CreateGhlToolDto.validate_raw(obj: struct)
        return Vapi::CreateGhlToolDto.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::CreateMakeToolDto.validate_raw(obj: struct)
        return Vapi::CreateMakeToolDto.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::CreateTransferCallToolDto.validate_raw(obj: struct)
        return Vapi::CreateTransferCallToolDto.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::CreateDtmfToolDto.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CreateEndCallToolDto.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CreateVoicemailToolDto.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CreateFunctionToolDto.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CreateGhlToolDto.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CreateMakeToolDto.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CreateTransferCallToolDto.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
