# frozen_string_literal: true

require_relative "test_suite_phone_number"
require_relative "assistant_overrides"
require "ostruct"
require "json"

module Vapi
  class TargetPlan
    # @return [String] This is the phone number that is being tested.
    #  During the actual test, it'll be called and the assistant attached to it will
    #  pick up and be tested.
    #  To test an assistant directly, send assistantId instead.
    attr_reader :phone_number_id
    # @return [Vapi::TestSuitePhoneNumber] This can be any phone number (even not on Vapi).
    #  During the actual test, it'll be called.
    #  To test a Vapi number, send phoneNumberId. To test an assistant directly, send
    #  assistantId instead.
    attr_reader :phone_number
    # @return [String] This is the assistant being tested.
    #  During the actual test, it'll invoked directly.
    #  To test the assistant over phone number, send phoneNumberId instead.
    attr_reader :assistant_id
    # @return [Vapi::AssistantOverrides] This is the assistant overrides applied to assistantId before it is tested.
    attr_reader :assistant_overrides
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number_id [String] This is the phone number that is being tested.
    #  During the actual test, it'll be called and the assistant attached to it will
    #  pick up and be tested.
    #  To test an assistant directly, send assistantId instead.
    # @param phone_number [Vapi::TestSuitePhoneNumber] This can be any phone number (even not on Vapi).
    #  During the actual test, it'll be called.
    #  To test a Vapi number, send phoneNumberId. To test an assistant directly, send
    #  assistantId instead.
    # @param assistant_id [String] This is the assistant being tested.
    #  During the actual test, it'll invoked directly.
    #  To test the assistant over phone number, send phoneNumberId instead.
    # @param assistant_overrides [Vapi::AssistantOverrides] This is the assistant overrides applied to assistantId before it is tested.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TargetPlan]
    def initialize(phone_number_id: OMIT, phone_number: OMIT, assistant_id: OMIT, assistant_overrides: OMIT,
                   additional_properties: nil)
      @phone_number_id = phone_number_id if phone_number_id != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "phoneNumberId": phone_number_id,
        "phoneNumber": phone_number,
        "assistantId": assistant_id,
        "assistantOverrides": assistant_overrides
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TargetPlan
    #
    # @param json_object [String]
    # @return [Vapi::TargetPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      phone_number_id = parsed_json["phoneNumberId"]
      if parsed_json["phoneNumber"].nil?
        phone_number = nil
      else
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::TestSuitePhoneNumber.from_json(json_object: phone_number)
      end
      assistant_id = parsed_json["assistantId"]
      if parsed_json["assistantOverrides"].nil?
        assistant_overrides = nil
      else
        assistant_overrides = parsed_json["assistantOverrides"].to_json
        assistant_overrides = Vapi::AssistantOverrides.from_json(json_object: assistant_overrides)
      end
      new(
        phone_number_id: phone_number_id,
        phone_number: phone_number,
        assistant_id: assistant_id,
        assistant_overrides: assistant_overrides,
        additional_properties: struct
      )
    end

    # Serialize an instance of TargetPlan to a JSON object
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
      obj.phone_number_id&.is_a?(String) != false || raise("Passed value for field obj.phone_number_id is not the expected type, validation failed.")
      obj.phone_number.nil? || Vapi::TestSuitePhoneNumber.validate_raw(obj: obj.phone_number)
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.assistant_overrides.nil? || Vapi::AssistantOverrides.validate_raw(obj: obj.assistant_overrides)
    end
  end
end
