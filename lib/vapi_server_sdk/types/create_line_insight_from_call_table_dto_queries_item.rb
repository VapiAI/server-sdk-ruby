# frozen_string_literal: true

require "json"
require_relative "json_query_on_call_table_with_string_type_column"
require_relative "json_query_on_call_table_with_number_type_column"
require_relative "json_query_on_call_table_with_structured_output_column"

module Vapi
  class CreateLineInsightFromCallTableDtoQueriesItem
    # Deserialize a JSON object to an instance of
    #  CreateLineInsightFromCallTableDtoQueriesItem
    #
    # @param json_object [String]
    # @return [Vapi::CreateLineInsightFromCallTableDtoQueriesItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vapi::JsonQueryOnCallTableWithStringTypeColumn.validate_raw(obj: struct)
        return Vapi::JsonQueryOnCallTableWithStringTypeColumn.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::JsonQueryOnCallTableWithNumberTypeColumn.validate_raw(obj: struct)
        return Vapi::JsonQueryOnCallTableWithNumberTypeColumn.from_json(json_object: struct) unless struct.nil?

        return nil
      rescue StandardError
        # noop
      end
      begin
        Vapi::JsonQueryOnCallTableWithStructuredOutputColumn.validate_raw(obj: struct)
        return Vapi::JsonQueryOnCallTableWithStructuredOutputColumn.from_json(json_object: struct) unless struct.nil?

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
        return Vapi::JsonQueryOnCallTableWithStringTypeColumn.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::JsonQueryOnCallTableWithNumberTypeColumn.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vapi::JsonQueryOnCallTableWithStructuredOutputColumn.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end
