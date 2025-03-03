# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Vapi
  class TestSuite
    # @return [String] This is the unique identifier for the test suite.
    attr_reader :id
    # @return [String] This is the unique identifier for the org that this test suite belongs to.
    attr_reader :org_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the test suite was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the test suite was last updated.
    attr_reader :updated_at
    # @return [String] This is the name of the test suite.
    attr_reader :name
    # @return [String] This is the phone number ID associated with this test suite.
    attr_reader :phone_number_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] This is the unique identifier for the test suite.
    # @param org_id [String] This is the unique identifier for the org that this test suite belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the test suite was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the test suite was last updated.
    # @param name [String] This is the name of the test suite.
    # @param phone_number_id [String] This is the phone number ID associated with this test suite.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TestSuite]
    def initialize(id:, org_id:, created_at:, updated_at:, name: OMIT, phone_number_id: OMIT,
                   additional_properties: nil)
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @phone_number_id = phone_number_id if phone_number_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "name": name,
        "phoneNumberId": phone_number_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TestSuite
    #
    # @param json_object [String]
    # @return [Vapi::TestSuite]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      name = parsed_json["name"]
      phone_number_id = parsed_json["phoneNumberId"]
      new(
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        phone_number_id: phone_number_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of TestSuite to a JSON object
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
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.phone_number_id&.is_a?(String) != false || raise("Passed value for field obj.phone_number_id is not the expected type, validation failed.")
    end
  end
end
