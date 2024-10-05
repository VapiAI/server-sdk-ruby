# frozen_string_literal: true

require "json"
require_relative "exact_replacement"
require_relative "regex_replacement"

module Vapi
  class FormatPlanReplacementsItem
    # Deserialize a JSON object to an instance of FormatPlanReplacementsItem
    #
    # @param json_object [String]
    # @return [Vapi::FormatPlanReplacementsItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::ExactReplacement.validate_raw(obj: struct)
        return Vapi::ExactReplacement.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::RegexReplacement.validate_raw(obj: struct)
        return Vapi::RegexReplacement.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::ExactReplacement.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::RegexReplacement.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
