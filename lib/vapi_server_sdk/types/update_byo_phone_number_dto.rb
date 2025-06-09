# frozen_string_literal: true
require_relative "update_byo_phone_number_dto_fallback_destination"
require_relative "phone_number_hook_call_ringing"
require_relative "server"
require "ostruct"
require "json"

module Vapi
  class UpdateByoPhoneNumberDto
  # @return [Vapi::UpdateByoPhoneNumberDtoFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
#  1. `assistantId` is not set
#  2. `squadId` is not set
#  3. and, `assistant-request` message to the `serverUrl` fails
#  If this is not set and above conditions are met, the inbound call is hung up
#  with an error message.
    attr_reader :fallback_destination
  # @return [Array<Vapi::PhoneNumberHookCallRinging>] This is the hooks that will be used for incoming calls to this phone number.
    attr_reader :hooks
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
  # @return [String] This is the name of the phone number. This is just for your own reference.
    attr_reader :name
  # @return [String] This is the assistant that will be used for incoming calls to this phone number.
#  If neither `assistantId`, `squadId` nor `workflowId` is set, `assistant-request`
#  will be sent to your Server URL. Check `ServerMessage` and
#  `ServerMessageResponse` for the shape of the message and response that is
#  expected.
    attr_reader :assistant_id
  # @return [String] This is the workflow that will be used for incoming calls to this phone number.
#  If neither `assistantId`, `squadId`, nor `workflowId` is set,
#  `assistant-request` will be sent to your Server URL. Check `ServerMessage` and
#  `ServerMessageResponse` for the shape of the message and response that is
#  expected.
    attr_reader :workflow_id
  # @return [String] This is the squad that will be used for incoming calls to this phone number.
#  If neither `assistantId`, `squadId`, nor `workflowId` is set,
#  `assistant-request` will be sent to your Server URL. Check `ServerMessage` and
#  `ServerMessageResponse` for the shape of the message and response that is
#  expected.
    attr_reader :squad_id
  # @return [Vapi::Server] This is where Vapi will send webhooks. You can find all webhooks available along
#  with their shape in ServerMessage schema.
#  The order of precedence is:
#  1. assistant.server
#  2. phoneNumber.server
#  3. org.server
    attr_reader :server
  # @return [String] This is the number of the customer.
    attr_reader :number
  # @return [String] This is the credential of your own SIP trunk or Carrier (type `byo-sip-trunk`)
#  which can be used to make calls to this phone number.
#  You can add the SIP trunk or Carrier credential in the Provider Credentials page
#  on the Dashboard to get the credentialId.
    attr_reader :credential_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param fallback_destination [Vapi::UpdateByoPhoneNumberDtoFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
#  1. `assistantId` is not set
#  2. `squadId` is not set
#  3. and, `assistant-request` message to the `serverUrl` fails
#  If this is not set and above conditions are met, the inbound call is hung up
#  with an error message.
    # @param hooks [Array<Vapi::PhoneNumberHookCallRinging>] This is the hooks that will be used for incoming calls to this phone number.
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
    # @param name [String] This is the name of the phone number. This is just for your own reference.
    # @param assistant_id [String] This is the assistant that will be used for incoming calls to this phone number.
#  If neither `assistantId`, `squadId` nor `workflowId` is set, `assistant-request`
#  will be sent to your Server URL. Check `ServerMessage` and
#  `ServerMessageResponse` for the shape of the message and response that is
#  expected.
    # @param workflow_id [String] This is the workflow that will be used for incoming calls to this phone number.
#  If neither `assistantId`, `squadId`, nor `workflowId` is set,
#  `assistant-request` will be sent to your Server URL. Check `ServerMessage` and
#  `ServerMessageResponse` for the shape of the message and response that is
#  expected.
    # @param squad_id [String] This is the squad that will be used for incoming calls to this phone number.
#  If neither `assistantId`, `squadId`, nor `workflowId` is set,
#  `assistant-request` will be sent to your Server URL. Check `ServerMessage` and
#  `ServerMessageResponse` for the shape of the message and response that is
#  expected.
    # @param server [Vapi::Server] This is where Vapi will send webhooks. You can find all webhooks available along
#  with their shape in ServerMessage schema.
#  The order of precedence is:
#  1. assistant.server
#  2. phoneNumber.server
#  3. org.server
    # @param number [String] This is the number of the customer.
    # @param credential_id [String] This is the credential of your own SIP trunk or Carrier (type `byo-sip-trunk`)
#  which can be used to make calls to this phone number.
#  You can add the SIP trunk or Carrier credential in the Provider Credentials page
#  on the Dashboard to get the credentialId.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateByoPhoneNumberDto]
    def initialize(fallback_destination: OMIT, hooks: OMIT, number_e_164_check_enabled: OMIT, name: OMIT, assistant_id: OMIT, workflow_id: OMIT, squad_id: OMIT, server: OMIT, number: OMIT, credential_id: OMIT, additional_properties: nil)
      @fallback_destination = fallback_destination if fallback_destination != OMIT
      @hooks = hooks if hooks != OMIT
      @number_e_164_check_enabled = number_e_164_check_enabled if number_e_164_check_enabled != OMIT
      @name = name if name != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @workflow_id = workflow_id if workflow_id != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @server = server if server != OMIT
      @number = number if number != OMIT
      @credential_id = credential_id if credential_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "fallbackDestination": fallback_destination, "hooks": hooks, "numberE164CheckEnabled": number_e_164_check_enabled, "name": name, "assistantId": assistant_id, "workflowId": workflow_id, "squadId": squad_id, "server": server, "number": number, "credentialId": credential_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateByoPhoneNumberDto
    #
    # @param json_object [String] 
    # @return [Vapi::UpdateByoPhoneNumberDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["fallbackDestination"].nil?
        fallback_destination = parsed_json["fallbackDestination"].to_json
        fallback_destination = Vapi::UpdateByoPhoneNumberDtoFallbackDestination.from_json(json_object: fallback_destination)
      else
        fallback_destination = nil
      end
      hooks = parsed_json["hooks"]&.map do | item |
  item = item.to_json
  Vapi::PhoneNumberHookCallRinging.from_json(json_object: item)
end
      number_e_164_check_enabled = parsed_json["numberE164CheckEnabled"]
      name = parsed_json["name"]
      assistant_id = parsed_json["assistantId"]
      workflow_id = parsed_json["workflowId"]
      squad_id = parsed_json["squadId"]
      unless parsed_json["server"].nil?
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      else
        server = nil
      end
      number = parsed_json["number"]
      credential_id = parsed_json["credentialId"]
      new(
        fallback_destination: fallback_destination,
        hooks: hooks,
        number_e_164_check_enabled: number_e_164_check_enabled,
        name: name,
        assistant_id: assistant_id,
        workflow_id: workflow_id,
        squad_id: squad_id,
        server: server,
        number: number,
        credential_id: credential_id,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateByoPhoneNumberDto to a JSON object
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
      obj.fallback_destination.nil? || Vapi::UpdateByoPhoneNumberDtoFallbackDestination.validate_raw(obj: obj.fallback_destination)
      obj.hooks&.is_a?(Array) != false || raise("Passed value for field obj.hooks is not the expected type, validation failed.")
      obj.number_e_164_check_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.number_e_164_check_enabled is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.workflow_id&.is_a?(String) != false || raise("Passed value for field obj.workflow_id is not the expected type, validation failed.")
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
      obj.number&.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
      obj.credential_id&.is_a?(String) != false || raise("Passed value for field obj.credential_id is not the expected type, validation failed.")
    end
  end
end