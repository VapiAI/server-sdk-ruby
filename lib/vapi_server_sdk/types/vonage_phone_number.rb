# frozen_string_literal: true

require_relative "vonage_phone_number_fallback_destination"
require "date"
require_relative "server"
require "ostruct"
require "json"

module Vapi
  class VonagePhoneNumber
    # @return [Vapi::VonagePhoneNumberFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
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
    # @return [Vapi::Server] This is where Vapi will send webhooks. You can find all webhooks available along
    #  with their shape in ServerMessage schema.
    #  The order of precedence is:
    #  1. assistant.server
    #  2. phoneNumber.server
    #  3. org.server
    attr_reader :server
    # @return [String] These are the digits of the phone number you own on your Vonage.
    attr_reader :number
    # @return [String] This is the credential that is used to make outgoing calls, and do operations
    #  like call transfer and hang up.
    attr_reader :credential_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param fallback_destination [Vapi::VonagePhoneNumberFallbackDestination] This is the fallback destination an inbound call will be transferred to if:
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
    # @param server [Vapi::Server] This is where Vapi will send webhooks. You can find all webhooks available along
    #  with their shape in ServerMessage schema.
    #  The order of precedence is:
    #  1. assistant.server
    #  2. phoneNumber.server
    #  3. org.server
    # @param number [String] These are the digits of the phone number you own on your Vonage.
    # @param credential_id [String] This is the credential that is used to make outgoing calls, and do operations
    #  like call transfer and hang up.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VonagePhoneNumber]
    def initialize(id:, org_id:, created_at:, updated_at:, number:, credential_id:, fallback_destination: OMIT, name: OMIT, assistant_id: OMIT,
                   squad_id: OMIT, server: OMIT, additional_properties: nil)
      @fallback_destination = fallback_destination if fallback_destination != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @server = server if server != OMIT
      @number = number
      @credential_id = credential_id
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
        "server": server,
        "number": number,
        "credentialId": credential_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of VonagePhoneNumber
    #
    # @param json_object [String]
    # @return [Vapi::VonagePhoneNumber]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["fallbackDestination"].nil?
        fallback_destination = nil
      else
        fallback_destination = parsed_json["fallbackDestination"].to_json
        fallback_destination = Vapi::VonagePhoneNumberFallbackDestination.from_json(json_object: fallback_destination)
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      name = parsed_json["name"]
      assistant_id = parsed_json["assistantId"]
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
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        assistant_id: assistant_id,
        squad_id: squad_id,
        server: server,
        number: number,
        credential_id: credential_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of VonagePhoneNumber to a JSON object
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
      obj.fallback_destination.nil? || Vapi::VonagePhoneNumberFallbackDestination.validate_raw(obj: obj.fallback_destination)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
      obj.number.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
      obj.credential_id.is_a?(String) != false || raise("Passed value for field obj.credential_id is not the expected type, validation failed.")
    end
  end
end
