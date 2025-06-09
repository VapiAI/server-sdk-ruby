# frozen_string_literal: true
require_relative "transfer_fallback_plan_message"
require "ostruct"
require "json"

module Vapi
  class TransferFallbackPlan
  # @return [Vapi::TransferFallbackPlanMessage] This is the message the assistant will deliver to the customer if the transfer
#  fails.
    attr_reader :message
  # @return [Boolean] This controls what happens after delivering the failure message to the customer.
#  - true: End the call after delivering the failure message (default)
#  - false: Keep the assistant on the call to continue handling the customer's
#  request
#  @default true
    attr_reader :end_call_enabled
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [Vapi::TransferFallbackPlanMessage] This is the message the assistant will deliver to the customer if the transfer
#  fails.
    # @param end_call_enabled [Boolean] This controls what happens after delivering the failure message to the customer.
#  - true: End the call after delivering the failure message (default)
#  - false: Keep the assistant on the call to continue handling the customer's
#  request
#  @default true
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TransferFallbackPlan]
    def initialize(message:, end_call_enabled: OMIT, additional_properties: nil)
      @message = message
      @end_call_enabled = end_call_enabled if end_call_enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = { "message": message, "endCallEnabled": end_call_enabled }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TransferFallbackPlan
    #
    # @param json_object [String] 
    # @return [Vapi::TransferFallbackPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["message"].nil?
        message = parsed_json["message"].to_json
        message = Vapi::TransferFallbackPlanMessage.from_json(json_object: message)
      else
        message = nil
      end
      end_call_enabled = parsed_json["endCallEnabled"]
      new(
        message: message,
        end_call_enabled: end_call_enabled,
        additional_properties: struct
      )
    end
# Serialize an instance of TransferFallbackPlan to a JSON object
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
      Vapi::TransferFallbackPlanMessage.validate_raw(obj: obj.message)
      obj.end_call_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.end_call_enabled is not the expected type, validation failed.")
    end
  end
end