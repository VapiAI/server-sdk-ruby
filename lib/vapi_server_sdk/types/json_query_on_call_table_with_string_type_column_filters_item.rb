# frozen_string_literal: true

require "json"
require_relative "filter_string_type_column_on_call_table"
require_relative "filter_string_array_type_column_on_call_table"
require_relative "filter_number_type_column_on_call_table"
require_relative "filter_number_array_type_column_on_call_table"
require_relative "filter_date_type_column_on_call_table"
require_relative "filter_structured_output_column_on_call_table"

module Vapi
  class JsonQueryOnCallTableWithStringTypeColumnFiltersItem
    # Deserialize a JSON object to an instance of
    #  JsonQueryOnCallTableWithStringTypeColumnFiltersItem
    #
    # @param json_object [String]
    # @return [Vapi::JsonQueryOnCallTableWithStringTypeColumnFiltersItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::FilterStringTypeColumnOnCallTable.validate_raw(obj: struct)
        return Vapi::FilterStringTypeColumnOnCallTable.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::FilterStringArrayTypeColumnOnCallTable.validate_raw(obj: struct)
        return Vapi::FilterStringArrayTypeColumnOnCallTable.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::FilterNumberTypeColumnOnCallTable.validate_raw(obj: struct)
        return Vapi::FilterNumberTypeColumnOnCallTable.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::FilterNumberArrayTypeColumnOnCallTable.validate_raw(obj: struct)
        return Vapi::FilterNumberArrayTypeColumnOnCallTable.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::FilterDateTypeColumnOnCallTable.validate_raw(obj: struct)
        return Vapi::FilterDateTypeColumnOnCallTable.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::FilterStructuredOutputColumnOnCallTable.validate_raw(obj: struct)
        return Vapi::FilterStructuredOutputColumnOnCallTable.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::FilterStringTypeColumnOnCallTable.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::FilterStringArrayTypeColumnOnCallTable.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::FilterNumberTypeColumnOnCallTable.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::FilterNumberArrayTypeColumnOnCallTable.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::FilterDateTypeColumnOnCallTable.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::FilterStructuredOutputColumnOnCallTable.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
