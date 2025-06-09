# frozen_string_literal: true
require_relative "create_customer_dto"
require "ostruct"
require "json"

module Vapi
  class CallBatchError
  # @return [Vapi::CreateCustomerDto] 
    attr_reader :customer
  # @return [String] 
    attr_reader :error
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param customer [Vapi::CreateCustomerDto] 
    # @param error [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CallBatchError]
    def initialize(customer:, error:, additional_properties: nil)
      @customer = customer
      @error = error
      @additional_properties = additional_properties
      @_field_set = { "customer": customer, "error": error }
    end
# Deserialize a JSON object to an instance of CallBatchError
    #
    # @param json_object [String] 
    # @return [Vapi::CallBatchError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["customer"].nil?
        customer = parsed_json["customer"].to_json
        customer = Vapi::CreateCustomerDto.from_json(json_object: customer)
      else
        customer = nil
      end
      error = parsed_json["error"]
      new(
        customer: customer,
        error: error,
        additional_properties: struct
      )
    end
# Serialize an instance of CallBatchError to a JSON object
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
      Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.error.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
    end
  end
end