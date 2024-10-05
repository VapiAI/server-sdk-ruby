# frozen_string_literal: true

require "json"
require_relative "make_tool_provider_details"
require_relative "ghl_tool_provider_details"
require_relative "function_tool_provider_details"

module Vapi
  class UpdateToolTemplateDtoProviderDetails
    # Deserialize a JSON object to an instance of UpdateToolTemplateDtoProviderDetails
    #
    # @param json_object [String]
    # @return [Vapi::UpdateToolTemplateDtoProviderDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::MakeToolProviderDetails.validate_raw(obj: struct)
        return Vapi::MakeToolProviderDetails.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::GhlToolProviderDetails.validate_raw(obj: struct)
        return Vapi::GhlToolProviderDetails.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::FunctionToolProviderDetails.validate_raw(obj: struct)
        return Vapi::FunctionToolProviderDetails.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::MakeToolProviderDetails.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::GhlToolProviderDetails.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::FunctionToolProviderDetails.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
