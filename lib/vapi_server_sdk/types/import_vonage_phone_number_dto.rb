# frozen_string_literal: true

require_relative "import_vonage_phone_number_dto_fallback_destination"
require_relative "server"
require "ostruct"
require "json"

module Vapi
  class ImportVonagePhoneNumberDto
    # @return [Vapi::ImportVonagePhoneNumberDtoFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
    #  1. `assistantId` is not set
    #  2. `squadId` is not set
    #  3. and, `assistant-request` message to the `serverUrl` fails
    #  If this is not set and above conditions are met, the inbound call is hung up
    #  with an error message.
    attr_reader :fallback_destination
    # @return [String] These are the digits of the phone number you own on your Vonage.
    attr_reader :vonage_phone_number
    # @return [String] This is the credential that is used to make outgoing calls, and do operations
    #  like call transfer and hang up.
    #  You can add the Vonage Credential in the Provider Credentials page on the
    #  dashboard to get the credentialId.
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
    # @return [Vapi::Server] This is where Vapi will send webhooks. You can find all webhooks available along
    #  with their shape in ServerMessage schema.
    #  The order of precedence is:
    #  1. assistant.server
    #  2. phoneNumber.server
    #  3. org.server
    attr_reader :server
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param fallback_destination [Vapi::ImportVonagePhoneNumberDtoFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
    #  1. `assistantId` is not set
    #  2. `squadId` is not set
    #  3. and, `assistant-request` message to the `serverUrl` fails
    #  If this is not set and above conditions are met, the inbound call is hung up
    #  with an error message.
    # @param vonage_phone_number [String] These are the digits of the phone number you own on your Vonage.
    # @param credential_id [String] This is the credential that is used to make outgoing calls, and do operations
    #  like call transfer and hang up.
    #  You can add the Vonage Credential in the Provider Credentials page on the
    #  dashboard to get the credentialId.
    # @param name [String] This is the name of the phone number. This is just for your own reference.
    # @param assistant_id [String] This is the assistant that will be used for incoming calls to this phone number.
    #  If neither `assistantId` nor `squadId` is set, `assistant-request` will be sent
    #  to your Server URL. Check `ServerMessage` and `ServerMessageResponse` for the
    #  shape of the message and response that is expected.
    # @param squad_id [String] This is the squad that will be used for incoming calls to this phone number.
    #  If neither `assistantId` nor `squadId` is set, `assistant-request` will be sent
    #  to your Server URL. Check `ServerMessage` and `ServerMessageResponse` for the
    #  shape of the message and response that is expected.
    # @param server [Vapi::Server] This is where Vapi will send webhooks. You can find all webhooks available along
    #  with their shape in ServerMessage schema.
    #  The order of precedence is:
    #  1. assistant.server
    #  2. phoneNumber.server
    #  3. org.server
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ImportVonagePhoneNumberDto]
    def initialize(vonage_phone_number:, credential_id:, fallback_destination: OMIT, name: OMIT, assistant_id: OMIT,
                   squad_id: OMIT, server: OMIT, additional_properties: nil)
      @fallback_destination = fallback_destination if fallback_destination != OMIT
      @vonage_phone_number = vonage_phone_number
      @credential_id = credential_id
      @name = name if name != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @server = server if server != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "fallbackDestination": fallback_destination,
        "vonagePhoneNumber": vonage_phone_number,
        "credentialId": credential_id,
        "name": name,
        "assistantId": assistant_id,
        "squadId": squad_id,
        "server": server
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ImportVonagePhoneNumberDto
    #
    # @param json_object [String]
    # @return [Vapi::ImportVonagePhoneNumberDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["fallbackDestination"].nil?
        fallback_destination = nil
      else
        fallback_destination = parsed_json["fallbackDestination"].to_json
        fallback_destination = Vapi::ImportVonagePhoneNumberDtoFallbackDestination.from_json(json_object: fallback_destination)
      end
      vonage_phone_number = parsed_json["vonagePhoneNumber"]
      credential_id = parsed_json["credentialId"]
      name = parsed_json["name"]
      assistant_id = parsed_json["assistantId"]
      squad_id = parsed_json["squadId"]
      if parsed_json["server"].nil?
        server = nil
      else
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      end
      new(
        fallback_destination: fallback_destination,
        vonage_phone_number: vonage_phone_number,
        credential_id: credential_id,
        name: name,
        assistant_id: assistant_id,
        squad_id: squad_id,
        server: server,
        additional_properties: struct
      )
    end

    # Serialize an instance of ImportVonagePhoneNumberDto to a JSON object
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
      obj.fallback_destination.nil? || Vapi::ImportVonagePhoneNumberDtoFallbackDestination.validate_raw(obj: obj.fallback_destination)
      obj.vonage_phone_number.is_a?(String) != false || raise("Passed value for field obj.vonage_phone_number is not the expected type, validation failed.")
      obj.credential_id.is_a?(String) != false || raise("Passed value for field obj.credential_id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
    end
  end
end
