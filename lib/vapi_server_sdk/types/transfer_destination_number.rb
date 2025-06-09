# frozen_string_literal: true
require_relative "transfer_destination_number_message"
require_relative "transfer_plan"
require "ostruct"
require "json"

module Vapi
  class TransferDestinationNumber
  # @return [Vapi::TransferDestinationNumberMessage] This is spoken to the customer before connecting them to the destination.
#  Usage:
#  - If this is not provided and transfer tool messages is not provided, default is
#  "Transferring the call now".
#  - If set to "", nothing is spoken. This is useful when you want to silently
#  transfer. This is especially useful when transferring between assistants in a
#  squad. In this scenario, you likely also want to set
#  `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message`
#  for the destination assistant.
#  This accepts a string or a ToolMessageStart class. Latter is useful if you want
#  to specify multiple messages for different languages through the `contents`
#  field.
    attr_reader :message
  # @return [Boolean] This is the flag to toggle the E164 check for the `number` field. This is an
#  advanced property which should be used if you know your use case requires it.
#  Use cases:
#  - `false`: To allow non-E164 numbers like `+001234567890`, `1234`, or `abc`.
#  This is useful for dialing out to non-E164 numbers on your SIP trunks.
#  - `true` (default): To allow only E164 numbers like `+14155551234`. This is
#  standard for PSTN calls.
#  If `false`, the `number` is still required to only contain alphanumeric
#  characters (regex: `/^\+?[a-zA-Z0-9]+$/`).
#  @default true (E164 check is enabled)
    attr_reader :number_e_164_check_enabled
  # @return [String] This is the phone number to transfer the call to.
    attr_reader :number
  # @return [String] This is the extension to dial after transferring the call to the `number`.
    attr_reader :extension
  # @return [String] This is the caller ID to use when transferring the call to the `number`.
#  Usage:
#  - If not provided, the caller ID will be the number the call is coming from.
#  Example, +14151111111 calls in to and the assistant transfers out to
#  +16470000000. +16470000000 will see +14151111111 as the caller.
#  - To change this behavior, provide a `callerId`.
#  - Set to '{{customer.number}}' to always use the customer's number as the caller
#  ID.
#  - Set to '{{phoneNumber.number}}' to always use the phone number of the
#  assistant as the caller ID.
#  - Set to any E164 number to always use that number as the caller ID. This needs
#  to be a number that is owned or verified by your Transport provider like Twilio.
#  For Twilio, you can read up more here:
#  https://www.twilio.com/docs/voice/twiml/dial#callerid
    attr_reader :caller_id
  # @return [Vapi::TransferPlan] This configures how transfer is executed and the experience of the destination
#  party receiving the call. Defaults to `blind-transfer`.
#  @default `transferPlan.mode='blind-transfer'`
    attr_reader :transfer_plan
  # @return [String] This is the description of the destination, used by the AI to choose when and
#  how to transfer the call.
    attr_reader :description
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [Vapi::TransferDestinationNumberMessage] This is spoken to the customer before connecting them to the destination.
#  Usage:
#  - If this is not provided and transfer tool messages is not provided, default is
#  "Transferring the call now".
#  - If set to "", nothing is spoken. This is useful when you want to silently
#  transfer. This is especially useful when transferring between assistants in a
#  squad. In this scenario, you likely also want to set
#  `assistant.firstMessageMode=assistant-speaks-first-with-model-generated-message`
#  for the destination assistant.
#  This accepts a string or a ToolMessageStart class. Latter is useful if you want
#  to specify multiple messages for different languages through the `contents`
#  field.
    # @param number_e_164_check_enabled [Boolean] This is the flag to toggle the E164 check for the `number` field. This is an
#  advanced property which should be used if you know your use case requires it.
#  Use cases:
#  - `false`: To allow non-E164 numbers like `+001234567890`, `1234`, or `abc`.
#  This is useful for dialing out to non-E164 numbers on your SIP trunks.
#  - `true` (default): To allow only E164 numbers like `+14155551234`. This is
#  standard for PSTN calls.
#  If `false`, the `number` is still required to only contain alphanumeric
#  characters (regex: `/^\+?[a-zA-Z0-9]+$/`).
#  @default true (E164 check is enabled)
    # @param number [String] This is the phone number to transfer the call to.
    # @param extension [String] This is the extension to dial after transferring the call to the `number`.
    # @param caller_id [String] This is the caller ID to use when transferring the call to the `number`.
#  Usage:
#  - If not provided, the caller ID will be the number the call is coming from.
#  Example, +14151111111 calls in to and the assistant transfers out to
#  +16470000000. +16470000000 will see +14151111111 as the caller.
#  - To change this behavior, provide a `callerId`.
#  - Set to '{{customer.number}}' to always use the customer's number as the caller
#  ID.
#  - Set to '{{phoneNumber.number}}' to always use the phone number of the
#  assistant as the caller ID.
#  - Set to any E164 number to always use that number as the caller ID. This needs
#  to be a number that is owned or verified by your Transport provider like Twilio.
#  For Twilio, you can read up more here:
#  https://www.twilio.com/docs/voice/twiml/dial#callerid
    # @param transfer_plan [Vapi::TransferPlan] This configures how transfer is executed and the experience of the destination
#  party receiving the call. Defaults to `blind-transfer`.
#  @default `transferPlan.mode='blind-transfer'`
    # @param description [String] This is the description of the destination, used by the AI to choose when and
#  how to transfer the call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TransferDestinationNumber]
    def initialize(message: OMIT, number_e_164_check_enabled: OMIT, number:, extension: OMIT, caller_id: OMIT, transfer_plan: OMIT, description: OMIT, additional_properties: nil)
      @message = message if message != OMIT
      @number_e_164_check_enabled = number_e_164_check_enabled if number_e_164_check_enabled != OMIT
      @number = number
      @extension = extension if extension != OMIT
      @caller_id = caller_id if caller_id != OMIT
      @transfer_plan = transfer_plan if transfer_plan != OMIT
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = { "message": message, "numberE164CheckEnabled": number_e_164_check_enabled, "number": number, "extension": extension, "callerId": caller_id, "transferPlan": transfer_plan, "description": description }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TransferDestinationNumber
    #
    # @param json_object [String] 
    # @return [Vapi::TransferDestinationNumber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["message"].nil?
        message = parsed_json["message"].to_json
        message = Vapi::TransferDestinationNumberMessage.from_json(json_object: message)
      else
        message = nil
      end
      number_e_164_check_enabled = parsed_json["numberE164CheckEnabled"]
      number = parsed_json["number"]
      extension = parsed_json["extension"]
      caller_id = parsed_json["callerId"]
      unless parsed_json["transferPlan"].nil?
        transfer_plan = parsed_json["transferPlan"].to_json
        transfer_plan = Vapi::TransferPlan.from_json(json_object: transfer_plan)
      else
        transfer_plan = nil
      end
      description = parsed_json["description"]
      new(
        message: message,
        number_e_164_check_enabled: number_e_164_check_enabled,
        number: number,
        extension: extension,
        caller_id: caller_id,
        transfer_plan: transfer_plan,
        description: description,
        additional_properties: struct
      )
    end
# Serialize an instance of TransferDestinationNumber to a JSON object
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
      obj.message.nil? || Vapi::TransferDestinationNumberMessage.validate_raw(obj: obj.message)
      obj.number_e_164_check_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.number_e_164_check_enabled is not the expected type, validation failed.")
      obj.number.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
      obj.extension&.is_a?(String) != false || raise("Passed value for field obj.extension is not the expected type, validation failed.")
      obj.caller_id&.is_a?(String) != false || raise("Passed value for field obj.caller_id is not the expected type, validation failed.")
      obj.transfer_plan.nil? || Vapi::TransferPlan.validate_raw(obj: obj.transfer_plan)
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end