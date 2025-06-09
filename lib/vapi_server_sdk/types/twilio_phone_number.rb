# frozen_string_literal: true
require_relative "twilio_phone_number_fallback_destination"
require_relative "phone_number_hook_call_ringing"
require "date"
require "date"
require_relative "twilio_phone_number_status"
require_relative "server"
require "ostruct"
require "json"

module Vapi
  class TwilioPhoneNumber
  # @return [Vapi::TwilioPhoneNumberFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
#  1. `assistantId` is not set
#  2. `squadId` is not set
#  3. and, `assistant-request` message to the `serverUrl` fails
#  If this is not set and above conditions are met, the inbound call is hung up
#  with an error message.
    attr_reader :fallback_destination
  # @return [Array<Vapi::PhoneNumberHookCallRinging>] This is the hooks that will be used for incoming calls to this phone number.
    attr_reader :hooks
  # @return [Boolean] Controls whether Vapi sets the messaging webhook URL on the Twilio number during
#  import.
#  If set to `false`, Vapi will not update the Twilio messaging URL, leaving it as
#  is.
#  If `true` or omitted (default), Vapi will configure both the voice and messaging
#  URLs.
#  @default true
    attr_reader :sms_enabled
  # @return [String] This is the unique identifier for the phone number.
    attr_reader :id
  # @return [String] This is the unique identifier for the org that this phone number belongs to.
    attr_reader :org_id
  # @return [DateTime] This is the ISO 8601 date-time string of when the phone number was created.
    attr_reader :created_at
  # @return [DateTime] This is the ISO 8601 date-time string of when the phone number was last updated.
    attr_reader :updated_at
  # @return [Vapi::TwilioPhoneNumberStatus] This is the status of the phone number.
    attr_reader :status
  # @return [String] This is the Twilio Auth Token for the phone number.
    attr_reader :twilio_auth_token
  # @return [String] This is the Twilio API Key for the phone number.
    attr_reader :twilio_api_key
  # @return [String] This is the Twilio API Secret for the phone number.
    attr_reader :twilio_api_secret
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
  # @return [String] These are the digits of the phone number you own on your Twilio.
    attr_reader :number
  # @return [String] This is the Twilio Account SID for the phone number.
    attr_reader :twilio_account_sid
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param fallback_destination [Vapi::TwilioPhoneNumberFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
#  1. `assistantId` is not set
#  2. `squadId` is not set
#  3. and, `assistant-request` message to the `serverUrl` fails
#  If this is not set and above conditions are met, the inbound call is hung up
#  with an error message.
    # @param hooks [Array<Vapi::PhoneNumberHookCallRinging>] This is the hooks that will be used for incoming calls to this phone number.
    # @param sms_enabled [Boolean] Controls whether Vapi sets the messaging webhook URL on the Twilio number during
#  import.
#  If set to `false`, Vapi will not update the Twilio messaging URL, leaving it as
#  is.
#  If `true` or omitted (default), Vapi will configure both the voice and messaging
#  URLs.
#  @default true
    # @param id [String] This is the unique identifier for the phone number.
    # @param org_id [String] This is the unique identifier for the org that this phone number belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the phone number was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the phone number was last updated.
    # @param status [Vapi::TwilioPhoneNumberStatus] This is the status of the phone number.
    # @param twilio_auth_token [String] This is the Twilio Auth Token for the phone number.
    # @param twilio_api_key [String] This is the Twilio API Key for the phone number.
    # @param twilio_api_secret [String] This is the Twilio API Secret for the phone number.
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
    # @param number [String] These are the digits of the phone number you own on your Twilio.
    # @param twilio_account_sid [String] This is the Twilio Account SID for the phone number.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TwilioPhoneNumber]
    def initialize(fallback_destination: OMIT, hooks: OMIT, sms_enabled: OMIT, id:, org_id:, created_at:, updated_at:, status: OMIT, twilio_auth_token: OMIT, twilio_api_key: OMIT, twilio_api_secret: OMIT, name: OMIT, assistant_id: OMIT, workflow_id: OMIT, squad_id: OMIT, server: OMIT, number:, twilio_account_sid:, additional_properties: nil)
      @fallback_destination = fallback_destination if fallback_destination != OMIT
      @hooks = hooks if hooks != OMIT
      @sms_enabled = sms_enabled if sms_enabled != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @status = status if status != OMIT
      @twilio_auth_token = twilio_auth_token if twilio_auth_token != OMIT
      @twilio_api_key = twilio_api_key if twilio_api_key != OMIT
      @twilio_api_secret = twilio_api_secret if twilio_api_secret != OMIT
      @name = name if name != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @workflow_id = workflow_id if workflow_id != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @server = server if server != OMIT
      @number = number
      @twilio_account_sid = twilio_account_sid
      @additional_properties = additional_properties
      @_field_set = { "fallbackDestination": fallback_destination, "hooks": hooks, "smsEnabled": sms_enabled, "id": id, "orgId": org_id, "createdAt": created_at, "updatedAt": updated_at, "status": status, "twilioAuthToken": twilio_auth_token, "twilioApiKey": twilio_api_key, "twilioApiSecret": twilio_api_secret, "name": name, "assistantId": assistant_id, "workflowId": workflow_id, "squadId": squad_id, "server": server, "number": number, "twilioAccountSid": twilio_account_sid }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TwilioPhoneNumber
    #
    # @param json_object [String] 
    # @return [Vapi::TwilioPhoneNumber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["fallbackDestination"].nil?
        fallback_destination = parsed_json["fallbackDestination"].to_json
        fallback_destination = Vapi::TwilioPhoneNumberFallbackDestination.from_json(json_object: fallback_destination)
      else
        fallback_destination = nil
      end
      hooks = parsed_json["hooks"]&.map do | item |
  item = item.to_json
  Vapi::PhoneNumberHookCallRinging.from_json(json_object: item)
end
      sms_enabled = parsed_json["smsEnabled"]
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
      status = parsed_json["status"]
      twilio_auth_token = parsed_json["twilioAuthToken"]
      twilio_api_key = parsed_json["twilioApiKey"]
      twilio_api_secret = parsed_json["twilioApiSecret"]
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
      twilio_account_sid = parsed_json["twilioAccountSid"]
      new(
        fallback_destination: fallback_destination,
        hooks: hooks,
        sms_enabled: sms_enabled,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        status: status,
        twilio_auth_token: twilio_auth_token,
        twilio_api_key: twilio_api_key,
        twilio_api_secret: twilio_api_secret,
        name: name,
        assistant_id: assistant_id,
        workflow_id: workflow_id,
        squad_id: squad_id,
        server: server,
        number: number,
        twilio_account_sid: twilio_account_sid,
        additional_properties: struct
      )
    end
# Serialize an instance of TwilioPhoneNumber to a JSON object
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
      obj.fallback_destination.nil? || Vapi::TwilioPhoneNumberFallbackDestination.validate_raw(obj: obj.fallback_destination)
      obj.hooks&.is_a?(Array) != false || raise("Passed value for field obj.hooks is not the expected type, validation failed.")
      obj.sms_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.sms_enabled is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.status&.is_a?(Vapi::TwilioPhoneNumberStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.twilio_auth_token&.is_a?(String) != false || raise("Passed value for field obj.twilio_auth_token is not the expected type, validation failed.")
      obj.twilio_api_key&.is_a?(String) != false || raise("Passed value for field obj.twilio_api_key is not the expected type, validation failed.")
      obj.twilio_api_secret&.is_a?(String) != false || raise("Passed value for field obj.twilio_api_secret is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.workflow_id&.is_a?(String) != false || raise("Passed value for field obj.workflow_id is not the expected type, validation failed.")
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
      obj.number.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
      obj.twilio_account_sid.is_a?(String) != false || raise("Passed value for field obj.twilio_account_sid is not the expected type, validation failed.")
    end
  end
end