# frozen_string_literal: true

require "json"
require_relative "../../types/handoff_step"
require_relative "../../types/callback_step"

module Vapi
  class Blocks
    class UpdateBlockDtoStepsItem
      # Deserialize a JSON object to an instance of UpdateBlockDtoStepsItem
      #
      # @param json_object [String]
      # @return [Vapi::Blocks::UpdateBlockDtoStepsItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Vapi::HandoffStep.validate_raw(obj: struct)
          return Vapi::HandoffStep.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::CallbackStep.validate_raw(obj: struct)
          return Vapi::CallbackStep.from_json(json_object: struct) unless struct.nil?

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
          return Vapi::HandoffStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::CallbackStep.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
