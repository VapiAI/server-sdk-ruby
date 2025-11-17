# frozen_string_literal: true

require_relative "tester_plan"
require_relative "target_plan"
require "ostruct"
require "json"

module Vapi
  class CreateTestSuiteDto
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

    # @param name [String] This is the name of the test suite.
    # @param phone_number_id [String] This is the phone number ID associated with this test suite.
    # @param tester_plan [Vapi::TesterPlan] Override the default tester plan by providing custom assistant configuration for
    #  the test agent.
    #  We recommend only using this if you are confident, as we have already set
    #  sensible defaults on the tester plan.
    # @param target_plan [Vapi::TargetPlan] These are the configuration for the assistant / phone number that is being
    #  tested.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateTestSuiteDto]
    def initialize(name: OMIT, phone_number_id: OMIT, tester_plan: OMIT, target_plan: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @phone_number_id = phone_number_id if phone_number_id != OMIT
      @tester_plan = tester_plan if tester_plan != OMIT
      @target_plan = target_plan if target_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "phoneNumberId": phone_number_id,
        "testerPlan": tester_plan,
        "targetPlan": target_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateTestSuiteDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateTestSuiteDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      phone_number_id = parsed_json["phoneNumberId"]
      if parsed_json["testerPlan"].nil?
        tester_plan = nil
      else
        tester_plan = parsed_json["testerPlan"].to_json
        tester_plan = Vapi::TesterPlan.from_json(json_object: tester_plan)
      end
      if parsed_json["targetPlan"].nil?
        target_plan = nil
      else
        target_plan = parsed_json["targetPlan"].to_json
        target_plan = Vapi::TargetPlan.from_json(json_object: target_plan)
      end
      new(
        name: name,
        phone_number_id: phone_number_id,
        tester_plan: tester_plan,
        target_plan: target_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateTestSuiteDto to a JSON object
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
      obj.phone_number_id&.is_a?(String) != false || raise("Passed value for field obj.phone_number_id is not the expected type, validation failed.")
      obj.tester_plan.nil? || Vapi::TesterPlan.validate_raw(obj: obj.tester_plan)
      obj.target_plan.nil? || Vapi::TargetPlan.validate_raw(obj: obj.target_plan)
    end
  end
end
