# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Vapi
  class InsightRunResponse
    # @return [String]
    attr_reader :id
    # @return [String]
    attr_reader :insight_id
    # @return [String]
    attr_reader :org_id
    # @return [DateTime]
    attr_reader :created_at
    # @return [DateTime]
    attr_reader :updated_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String]
    # @param insight_id [String]
    # @param org_id [String]
    # @param created_at [DateTime]
    # @param updated_at [DateTime]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::InsightRunResponse]
    def initialize(id:, insight_id:, org_id:, created_at:, updated_at:, additional_properties: nil)
      @id = id
      @insight_id = insight_id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "insightId": insight_id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at
      }
    end

    # Deserialize a JSON object to an instance of InsightRunResponse
    #
    # @param json_object [String]
    # @return [Vapi::InsightRunResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      insight_id = parsed_json["insightId"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      new(
        id: id,
        insight_id: insight_id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of InsightRunResponse to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.insight_id.is_a?(String) != false || raise("Passed value for field obj.insight_id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end
