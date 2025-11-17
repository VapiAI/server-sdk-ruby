# frozen_string_literal: true

require_relative "test_suite_phone_number_provider"
require "ostruct"
require "json"

module Vapi
  class TestSuitePhoneNumber
    # @return [Vapi::TestSuitePhoneNumberProvider] This is the provider of the phone number.
    attr_reader :provider
    # @return [String] This is the phone number that is being tested.
    attr_reader :number
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [Vapi::TestSuitePhoneNumberProvider] This is the provider of the phone number.
    # @param number [String] This is the phone number that is being tested.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TestSuitePhoneNumber]
    def initialize(provider:, number:, additional_properties: nil)
      @provider = provider
      @number = number
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "number": number }
    end

    # Deserialize a JSON object to an instance of TestSuitePhoneNumber
    #
    # @param json_object [String]
    # @return [Vapi::TestSuitePhoneNumber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      number = parsed_json["number"]
      new(
        provider: provider,
        number: number,
        additional_properties: struct
      )
    end

    # Serialize an instance of TestSuitePhoneNumber to a JSON object
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
      obj.provider.is_a?(Vapi::TestSuitePhoneNumberProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.number.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
    end
  end
end
