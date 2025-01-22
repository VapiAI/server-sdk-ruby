# frozen_string_literal: true

require "json"
require_relative "say"
require_relative "gather"
require_relative "create_workflow_dto"

module Vapi
  class CreateWorkflowDtoNodesItem
    # Deserialize a JSON object to an instance of CreateWorkflowDtoNodesItem
    #
    # @param json_object [String]
    # @return [Vapi::CreateWorkflowDtoNodesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::Say.validate_raw(obj: struct)
        return Vapi::Say.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::Gather.validate_raw(obj: struct)
        return Vapi::Gather.from_json(json_object: struct) unless struct.nil?

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
        Vapi::CreateWorkflowDto.validate_raw(obj: struct)
        return Vapi::CreateWorkflowDto.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::Say.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::Gather.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return obj.is_a?(Object) != false || raise("Passed value for field obj is not the expected type, validation failed.")
      rescue StandardError
        # noop
      end
      begin
        return Vapi::CreateWorkflowDto.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
