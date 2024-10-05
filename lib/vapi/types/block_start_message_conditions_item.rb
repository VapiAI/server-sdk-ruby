# frozen_string_literal: true

require "json"
require_relative "model_based_condition"
require_relative "rule_based_condition"

module Vapi
  class BlockStartMessageConditionsItem
    # Deserialize a JSON object to an instance of BlockStartMessageConditionsItem
    #
    # @param json_object [String]
    # @return [Vapi::BlockStartMessageConditionsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::ModelBasedCondition.validate_raw(obj: struct)
        return Vapi::ModelBasedCondition.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::RuleBasedCondition.validate_raw(obj: struct)
        return Vapi::RuleBasedCondition.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::ModelBasedCondition.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::RuleBasedCondition.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
