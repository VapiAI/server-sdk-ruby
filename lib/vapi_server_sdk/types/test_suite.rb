# frozen_string_literal: true
require "date"
require "date"
require_relative "tester_plan"
require_relative "target_plan"
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
  # @return [Vapi::TesterPlan] Override the default tester plan by providing custom assistant configuration for
#  the test agent.
#  We recommend only using this if you are confident, as we have already set
#  sensible defaults on the tester plan.
    attr_reader :tester_plan
  # @return [Vapi::TargetPlan] These are the configuration for the assistant / phone number that is being
#  tested.
    attr_reader :target_plan
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
    # @param tester_plan [Vapi::TesterPlan] Override the default tester plan by providing custom assistant configuration for
#  the test agent.
#  We recommend only using this if you are confident, as we have already set
#  sensible defaults on the tester plan.
    # @param target_plan [Vapi::TargetPlan] These are the configuration for the assistant / phone number that is being
#  tested.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TestSuite]
    def initialize(id:, org_id:, created_at:, updated_at:, name: OMIT, phone_number_id: OMIT, tester_plan: OMIT, target_plan: OMIT, additional_properties: nil)
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @phone_number_id = phone_number_id if phone_number_id != OMIT
      @tester_plan = tester_plan if tester_plan != OMIT
      @target_plan = target_plan if target_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "orgId": org_id, "createdAt": created_at, "updatedAt": updated_at, "name": name, "phoneNumberId": phone_number_id, "testerPlan": tester_plan, "targetPlan": target_plan }.reject do | _k, v |
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
      created_at = unless parsed_json["createdAt"].nil?
  DateTime.parse(parsed_json["createdAt"])
else
  nil
end
      updated_at = unless parsed_json["updatedAt"].nil?
  DateTime.parse(parsed_json["updatedAt"])
else
  nil
end
      name = parsed_json["name"]
      phone_number_id = parsed_json["phoneNumberId"]
      unless parsed_json["testerPlan"].nil?
        tester_plan = parsed_json["testerPlan"].to_json
        tester_plan = Vapi::TesterPlan.from_json(json_object: tester_plan)
      else
        tester_plan = nil
      end
      unless parsed_json["targetPlan"].nil?
        target_plan = parsed_json["targetPlan"].to_json
        target_plan = Vapi::TargetPlan.from_json(json_object: target_plan)
      else
        target_plan = nil
      end
      new(
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        phone_number_id: phone_number_id,
        tester_plan: tester_plan,
        target_plan: target_plan,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuite to a JSON object
    #
    # @return [String]
    def to_json
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
      obj.tester_plan.nil? || Vapi::TesterPlan.validate_raw(obj: obj.tester_plan)
      obj.target_plan.nil? || Vapi::TargetPlan.validate_raw(obj: obj.target_plan)
    end
  end
end