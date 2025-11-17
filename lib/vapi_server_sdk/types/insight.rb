# frozen_string_literal: true

require_relative "insight_type"
require "date"
require "ostruct"
require "json"

module Vapi
  class Insight
    # @return [String] This is the name of the Insight.
    attr_reader :name
    # @return [Vapi::InsightType] This is the type of the Insight.
    attr_reader :type
    # @return [String] This is the unique identifier for the Insight.
    attr_reader :id
    # @return [String] This is the unique identifier for the org that this Insight belongs to.
    attr_reader :org_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the Insight was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the Insight was last updated.
    attr_reader :updated_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of the Insight.
    # @param type [Vapi::InsightType] This is the type of the Insight.
    # @param id [String] This is the unique identifier for the Insight.
    # @param org_id [String] This is the unique identifier for the org that this Insight belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the Insight was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the Insight was last updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Insight]
    def initialize(type:, id:, org_id:, created_at:, updated_at:, name: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @type = type
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "type": type,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Insight
    #
    # @param json_object [String]
    # @return [Vapi::Insight]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      type = parsed_json["type"]
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      new(
        name: name,
        type: type,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of Insight to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.type.is_a?(Vapi::InsightType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end
