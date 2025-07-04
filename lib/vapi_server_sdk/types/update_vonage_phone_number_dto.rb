# frozen_string_literal: true

require_relative "update_vonage_phone_number_dto_fallback_destination"
require_relative "phone_number_hook_call_ringing"
require_relative "server"
require "ostruct"
require "json"

module Vapi
  class UpdateVonagePhoneNumberDto
    # @return [Vapi::UpdateVonagePhoneNumberDtoFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
    #  1. `assistantId` is not set
    #  2. `squadId` is not set
    #  3. and, `assistant-request` message to the `serverUrl` fails
    #  If this is not set and above conditions are met, the inbound call is hung up
    #  with an error message.
    attr_reader :fallback_destination
    # @return [Array<Vapi::PhoneNumberHookCallRinging>] This is the hooks that will be used for incoming calls to this phone number.
    attr_reader :hooks
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
    # @return [String] These are the digits of the phone number you own on your Vonage.
    attr_reader :number
    # @return [String] This is the credential you added in dashboard.vapi.ai/keys. This is used to
    #  configure the number to send inbound calls to Vapi, make outbound calls and do
    #  live call updates like transfers and hangups.
    attr_reader :credential_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param fallback_destination [Vapi::UpdateVonagePhoneNumberDtoFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
    #  1. `assistantId` is not set
    #  2. `squadId` is not set
    #  3. and, `assistant-request` message to the `serverUrl` fails
    #  If this is not set and above conditions are met, the inbound call is hung up
    #  with an error message.
    # @param hooks [Array<Vapi::PhoneNumberHookCallRinging>] This is the hooks that will be used for incoming calls to this phone number.
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
    # @param number [String] These are the digits of the phone number you own on your Vonage.
    # @param credential_id [String] This is the credential you added in dashboard.vapi.ai/keys. This is used to
    #  configure the number to send inbound calls to Vapi, make outbound calls and do
    #  live call updates like transfers and hangups.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateVonagePhoneNumberDto]
    def initialize(fallback_destination: OMIT, hooks: OMIT, name: OMIT, assistant_id: OMIT, workflow_id: OMIT,
                   squad_id: OMIT, server: OMIT, number: OMIT, credential_id: OMIT, additional_properties: nil)
      @fallback_destination = fallback_destination if fallback_destination != OMIT
      @hooks = hooks if hooks != OMIT
      @name = name if name != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @workflow_id = workflow_id if workflow_id != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @server = server if server != OMIT
      @number = number if number != OMIT
      @credential_id = credential_id if credential_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "fallbackDestination": fallback_destination,
        "hooks": hooks,
        "name": name,
        "assistantId": assistant_id,
        "workflowId": workflow_id,
        "squadId": squad_id,
        "server": server,
        "number": number,
        "credentialId": credential_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateVonagePhoneNumberDto
    #
    # @param json_object [String]
    # @return [Vapi::UpdateVonagePhoneNumberDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["fallbackDestination"].nil?
        fallback_destination = nil
      else
        fallback_destination = parsed_json["fallbackDestination"].to_json
        fallback_destination = Vapi::UpdateVonagePhoneNumberDtoFallbackDestination.from_json(json_object: fallback_destination)
      end
      hooks = parsed_json["hooks"]&.map do |item|
        item = item.to_json
        Vapi::PhoneNumberHookCallRinging.from_json(json_object: item)
      end
      name = parsed_json["name"]
      assistant_id = parsed_json["assistantId"]
      workflow_id = parsed_json["workflowId"]
      squad_id = parsed_json["squadId"]
      if parsed_json["server"].nil?
        server = nil
      else
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      end
      number = parsed_json["number"]
      credential_id = parsed_json["credentialId"]
      new(
        fallback_destination: fallback_destination,
        hooks: hooks,
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

    # Serialize an instance of UpdateVonagePhoneNumberDto to a JSON object
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
      obj.fallback_destination.nil? || Vapi::UpdateVonagePhoneNumberDtoFallbackDestination.validate_raw(obj: obj.fallback_destination)
      obj.hooks&.is_a?(Array) != false || raise("Passed value for field obj.hooks is not the expected type, validation failed.")
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
