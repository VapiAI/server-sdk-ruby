# frozen_string_literal: true

require_relative "create_byo_phone_number_dto_fallback_destination"
require "ostruct"
require "json"

module Vapi
  class CreateByoPhoneNumberDto
    # @return [Vapi::CreateByoPhoneNumberDtoFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
    #  1. `assistantId` is not set
    #  2. `squadId` is not set
    #  3. and, `assistant-request` message to the `serverUrl` fails
    #  If this is not set and above conditions are met, the inbound call is hung up
    #  with an error message.
    attr_reader :fallback_destination
    # @return [String]
    attr_reader :provider
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
    # @return [String] This is the number of the customer.
    attr_reader :number
    # @return [String] This is the credential of your own SIP trunk or Carrier (type `byo-sip-trunk`)
    #  which can be used to make calls to this phone number.
    #  You can add the SIP trunk or Carrier credential in the Provider Credentials page
    #  on the Dashboard to get the credentialId.
    attr_reader :credential_id
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

    # @param fallback_destination [Vapi::CreateByoPhoneNumberDtoFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
    #  1. `assistantId` is not set
    #  2. `squadId` is not set
    #  3. and, `assistant-request` message to the `serverUrl` fails
    #  If this is not set and above conditions are met, the inbound call is hung up
    #  with an error message.
    # @param provider [String]
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
    # @param number [String] This is the number of the customer.
    # @param credential_id [String] This is the credential of your own SIP trunk or Carrier (type `byo-sip-trunk`)
    #  which can be used to make calls to this phone number.
    #  You can add the SIP trunk or Carrier credential in the Provider Credentials page
    #  on the Dashboard to get the credentialId.
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
    # @return [Vapi::CreateByoPhoneNumberDto]
    def initialize(provider:, credential_id:, fallback_destination: OMIT, number_e_164_check_enabled: OMIT,
                   number: OMIT, name: OMIT, assistant_id: OMIT, squad_id: OMIT, server_url: OMIT, server_url_secret: OMIT, additional_properties: nil)
      @fallback_destination = fallback_destination if fallback_destination != OMIT
      @provider = provider
      @number_e_164_check_enabled = number_e_164_check_enabled if number_e_164_check_enabled != OMIT
      @number = number if number != OMIT
      @credential_id = credential_id
      @name = name if name != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @server_url = server_url if server_url != OMIT
      @server_url_secret = server_url_secret if server_url_secret != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "fallbackDestination": fallback_destination,
        "provider": provider,
        "numberE164CheckEnabled": number_e_164_check_enabled,
        "number": number,
        "credentialId": credential_id,
        "name": name,
        "assistantId": assistant_id,
        "squadId": squad_id,
        "serverUrl": server_url,
        "serverUrlSecret": server_url_secret
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateByoPhoneNumberDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateByoPhoneNumberDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["fallbackDestination"].nil?
        fallback_destination = nil
      else
        fallback_destination = parsed_json["fallbackDestination"].to_json
        fallback_destination = Vapi::CreateByoPhoneNumberDtoFallbackDestination.from_json(json_object: fallback_destination)
      end
      provider = parsed_json["provider"]
      number_e_164_check_enabled = parsed_json["numberE164CheckEnabled"]
      number = parsed_json["number"]
      credential_id = parsed_json["credentialId"]
      name = parsed_json["name"]
      assistant_id = parsed_json["assistantId"]
      squad_id = parsed_json["squadId"]
      server_url = parsed_json["serverUrl"]
      server_url_secret = parsed_json["serverUrlSecret"]
      new(
        fallback_destination: fallback_destination,
        provider: provider,
        number_e_164_check_enabled: number_e_164_check_enabled,
        number: number,
        credential_id: credential_id,
        name: name,
        assistant_id: assistant_id,
        squad_id: squad_id,
        server_url: server_url,
        server_url_secret: server_url_secret,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateByoPhoneNumberDto to a JSON object
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
      obj.fallback_destination.nil? || Vapi::CreateByoPhoneNumberDtoFallbackDestination.validate_raw(obj: obj.fallback_destination)
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.number_e_164_check_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.number_e_164_check_enabled is not the expected type, validation failed.")
      obj.number&.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
      obj.credential_id.is_a?(String) != false || raise("Passed value for field obj.credential_id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.server_url&.is_a?(String) != false || raise("Passed value for field obj.server_url is not the expected type, validation failed.")
      obj.server_url_secret&.is_a?(String) != false || raise("Passed value for field obj.server_url_secret is not the expected type, validation failed.")
    end
  end
end
