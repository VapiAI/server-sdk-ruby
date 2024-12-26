# frozen_string_literal: true

require_relative "vapi_phone_number_fallback_destination"
require "date"
require_relative "sip_authentication"
require "ostruct"
require "json"

module Vapi
  class VapiPhoneNumber
    # @return [Vapi::VapiPhoneNumberFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
    #  1. `assistantId` is not set
    #  2. `squadId` is not set
    #  3. and, `assistant-request` message to the `serverUrl` fails
    #  If this is not set and above conditions are met, the inbound call is hung up
    #  with an error message.
    attr_reader :fallback_destination
    # @return [String] This is the unique identifier for the phone number.
    attr_reader :id
    # @return [String] This is the unique identifier for the org that this phone number belongs to.
    attr_reader :org_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the phone number was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the phone number was last updated.
    attr_reader :updated_at
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
    # @return [String] This is the SIP URI of the phone number. You can SIP INVITE this. The assistant
    #  attached to this number will answer.
    #  This is case-insensitive.
    attr_reader :sip_uri
    # @return [Vapi::SipAuthentication] This enables authentication for incoming SIP INVITE requests to the `sipUri`.
    #  If not set, any username/password to the 401 challenge of the SIP INVITE will be
    #  accepted.
    attr_reader :authentication
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param fallback_destination [Vapi::VapiPhoneNumberFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
    #  1. `assistantId` is not set
    #  2. `squadId` is not set
    #  3. and, `assistant-request` message to the `serverUrl` fails
    #  If this is not set and above conditions are met, the inbound call is hung up
    #  with an error message.
    # @param id [String] This is the unique identifier for the phone number.
    # @param org_id [String] This is the unique identifier for the org that this phone number belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the phone number was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the phone number was last updated.
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
    # @param sip_uri [String] This is the SIP URI of the phone number. You can SIP INVITE this. The assistant
    #  attached to this number will answer.
    #  This is case-insensitive.
    # @param authentication [Vapi::SipAuthentication] This enables authentication for incoming SIP INVITE requests to the `sipUri`.
    #  If not set, any username/password to the 401 challenge of the SIP INVITE will be
    #  accepted.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VapiPhoneNumber]
    def initialize(id:, org_id:, created_at:, updated_at:, sip_uri:, fallback_destination: OMIT, name: OMIT, assistant_id: OMIT,
                   squad_id: OMIT, server_url: OMIT, server_url_secret: OMIT, authentication: OMIT, additional_properties: nil)
      @fallback_destination = fallback_destination if fallback_destination != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @server_url = server_url if server_url != OMIT
      @server_url_secret = server_url_secret if server_url_secret != OMIT
      @sip_uri = sip_uri
      @authentication = authentication if authentication != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "fallbackDestination": fallback_destination,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "name": name,
        "assistantId": assistant_id,
        "squadId": squad_id,
        "serverUrl": server_url,
        "serverUrlSecret": server_url_secret,
        "sipUri": sip_uri,
        "authentication": authentication
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of VapiPhoneNumber
    #
    # @param json_object [String]
    # @return [Vapi::VapiPhoneNumber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["fallbackDestination"].nil?
        fallback_destination = nil
      else
        fallback_destination = parsed_json["fallbackDestination"].to_json
        fallback_destination = Vapi::VapiPhoneNumberFallbackDestination.from_json(json_object: fallback_destination)
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      name = parsed_json["name"]
      assistant_id = parsed_json["assistantId"]
      squad_id = parsed_json["squadId"]
      server_url = parsed_json["serverUrl"]
      server_url_secret = parsed_json["serverUrlSecret"]
      sip_uri = parsed_json["sipUri"]
      if parsed_json["authentication"].nil?
        authentication = nil
      else
        authentication = parsed_json["authentication"].to_json
        authentication = Vapi::SipAuthentication.from_json(json_object: authentication)
      end
      new(
        fallback_destination: fallback_destination,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        assistant_id: assistant_id,
        squad_id: squad_id,
        server_url: server_url,
        server_url_secret: server_url_secret,
        sip_uri: sip_uri,
        authentication: authentication,
        additional_properties: struct
      )
    end

    # Serialize an instance of VapiPhoneNumber to a JSON object
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
      obj.fallback_destination.nil? || Vapi::VapiPhoneNumberFallbackDestination.validate_raw(obj: obj.fallback_destination)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.server_url&.is_a?(String) != false || raise("Passed value for field obj.server_url is not the expected type, validation failed.")
      obj.server_url_secret&.is_a?(String) != false || raise("Passed value for field obj.server_url_secret is not the expected type, validation failed.")
      obj.sip_uri.is_a?(String) != false || raise("Passed value for field obj.sip_uri is not the expected type, validation failed.")
      obj.authentication.nil? || Vapi::SipAuthentication.validate_raw(obj: obj.authentication)
    end
  end
end
