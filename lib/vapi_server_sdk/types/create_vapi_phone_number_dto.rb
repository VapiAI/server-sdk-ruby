# frozen_string_literal: true

require_relative "create_vapi_phone_number_dto_fallback_destination"
require "ostruct"
require "json"

module Vapi
  class CreateVapiPhoneNumberDto
    # @return [Vapi::CreateVapiPhoneNumberDtoFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
    #  1. `assistantId` is not set
    #  2. `squadId` is not set
    #  3. and, `assistant-request` message to the `serverUrl` fails
    #  If this is not set and above conditions are met, the inbound call is hung up
    #  with an error message.
    attr_reader :fallback_destination
    # @return [String] This is the SIP URI of the phone number. You can SIP INVITE this. The assistant
    #  attached to this number will answer.
    #  This is case-insensitive.
    attr_reader :sip_uri
    # @return [String] This is the name of the phone number. This is just for your own reference.
    attr_reader :name
    # @return [String] This is the assistant that will be used for incoming calls to this phone number.
    #  If neither `assistantId` nor `squadId` is set, `assistant-request` will be sent
    #  to your Server URL. Check `ServerMessage` and `ServerMessageResponse` for the
    #  shape of the message and response that is expected.
    attr_reader :assistant_id
    # @return [String] This is the squad that will be used for incoming calls to this phone number.
    #  If neither `assistantId` nor `squadId` is set, `assistant-request` will be sent
    #  to your Server URL. Check `ServerMessage` and `ServerMessageResponse` for the
    #  shape of the message and response that is expected.
    attr_reader :squad_id
    # @return [String] This is the server URL where messages will be sent for calls on this number.
    #  This includes the `assistant-request` message.
    #  You can see the shape of the messages sent in `ServerMessage`.
    #  This overrides the `org.serverUrl`. Order of precedence: tool.server.url >
    #  assistant.serverUrl > phoneNumber.serverUrl > org.serverUrl.
    attr_reader :server_url
    # @return [String] This is the secret Vapi will send with every message to your server. It's sent
    #  as a header called x-vapi-secret.
    #  Same precedence logic as serverUrl.
    attr_reader :server_url_secret
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param fallback_destination [Vapi::CreateVapiPhoneNumberDtoFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
    #  1. `assistantId` is not set
    #  2. `squadId` is not set
    #  3. and, `assistant-request` message to the `serverUrl` fails
    #  If this is not set and above conditions are met, the inbound call is hung up
    #  with an error message.
    # @param sip_uri [String] This is the SIP URI of the phone number. You can SIP INVITE this. The assistant
    #  attached to this number will answer.
    #  This is case-insensitive.
    # @param name [String] This is the name of the phone number. This is just for your own reference.
    # @param assistant_id [String] This is the assistant that will be used for incoming calls to this phone number.
    #  If neither `assistantId` nor `squadId` is set, `assistant-request` will be sent
    #  to your Server URL. Check `ServerMessage` and `ServerMessageResponse` for the
    #  shape of the message and response that is expected.
    # @param squad_id [String] This is the squad that will be used for incoming calls to this phone number.
    #  If neither `assistantId` nor `squadId` is set, `assistant-request` will be sent
    #  to your Server URL. Check `ServerMessage` and `ServerMessageResponse` for the
    #  shape of the message and response that is expected.
    # @param server_url [String] This is the server URL where messages will be sent for calls on this number.
    #  This includes the `assistant-request` message.
    #  You can see the shape of the messages sent in `ServerMessage`.
    #  This overrides the `org.serverUrl`. Order of precedence: tool.server.url >
    #  assistant.serverUrl > phoneNumber.serverUrl > org.serverUrl.
    # @param server_url_secret [String] This is the secret Vapi will send with every message to your server. It's sent
    #  as a header called x-vapi-secret.
    #  Same precedence logic as serverUrl.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateVapiPhoneNumberDto]
    def initialize(sip_uri:, fallback_destination: OMIT, name: OMIT, assistant_id: OMIT, squad_id: OMIT,
                   server_url: OMIT, server_url_secret: OMIT, additional_properties: nil)
      @fallback_destination = fallback_destination if fallback_destination != OMIT
      @sip_uri = sip_uri
      @name = name if name != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @server_url = server_url if server_url != OMIT
      @server_url_secret = server_url_secret if server_url_secret != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "fallbackDestination": fallback_destination,
        "sipUri": sip_uri,
        "name": name,
        "assistantId": assistant_id,
        "squadId": squad_id,
        "serverUrl": server_url,
        "serverUrlSecret": server_url_secret
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateVapiPhoneNumberDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateVapiPhoneNumberDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["fallbackDestination"].nil?
        fallback_destination = nil
      else
        fallback_destination = parsed_json["fallbackDestination"].to_json
        fallback_destination = Vapi::CreateVapiPhoneNumberDtoFallbackDestination.from_json(json_object: fallback_destination)
      end
      sip_uri = parsed_json["sipUri"]
      name = parsed_json["name"]
      assistant_id = parsed_json["assistantId"]
      squad_id = parsed_json["squadId"]
      server_url = parsed_json["serverUrl"]
      server_url_secret = parsed_json["serverUrlSecret"]
      new(
        fallback_destination: fallback_destination,
        sip_uri: sip_uri,
        name: name,
        assistant_id: assistant_id,
        squad_id: squad_id,
        server_url: server_url,
        server_url_secret: server_url_secret,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateVapiPhoneNumberDto to a JSON object
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
      obj.fallback_destination.nil? || Vapi::CreateVapiPhoneNumberDtoFallbackDestination.validate_raw(obj: obj.fallback_destination)
      obj.sip_uri.is_a?(String) != false || raise("Passed value for field obj.sip_uri is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.server_url&.is_a?(String) != false || raise("Passed value for field obj.server_url is not the expected type, validation failed.")
      obj.server_url_secret&.is_a?(String) != false || raise("Passed value for field obj.server_url_secret is not the expected type, validation failed.")
    end
  end
end