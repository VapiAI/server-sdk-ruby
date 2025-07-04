# frozen_string_literal: true

require_relative "chat_assistant_overrides"
require "ostruct"
require "json"

module Vapi
  class CreateWebCustomerDto
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
    # @return [String] This is the extension that will be dialed after the call is answered.
    attr_reader :extension
    # @return [Vapi::ChatAssistantOverrides] These are the variable values that will be used to replace template variables in
    #  the assistant messages.
    #  Only variable substitution is supported in web chat - other assistant properties
    #  cannot be overridden.
    attr_reader :assistant_overrides
    # @return [String] This is the number of the customer.
    attr_reader :number
    # @return [String] This is the SIP URI of the customer.
    attr_reader :sip_uri
    # @return [String] This is the name of the customer. This is just for your own reference.
    #  For SIP inbound calls, this is extracted from the `From` SIP header with format
    #  `"Display Name" <sip:username@domain>`.
    attr_reader :name
    # @return [String] This is the email of the customer.
    attr_reader :email
    # @return [String] This is the external ID of the customer.
    attr_reader :external_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

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
    # @param extension [String] This is the extension that will be dialed after the call is answered.
    # @param assistant_overrides [Vapi::ChatAssistantOverrides] These are the variable values that will be used to replace template variables in
    #  the assistant messages.
    #  Only variable substitution is supported in web chat - other assistant properties
    #  cannot be overridden.
    # @param number [String] This is the number of the customer.
    # @param sip_uri [String] This is the SIP URI of the customer.
    # @param name [String] This is the name of the customer. This is just for your own reference.
    #  For SIP inbound calls, this is extracted from the `From` SIP header with format
    #  `"Display Name" <sip:username@domain>`.
    # @param email [String] This is the email of the customer.
    # @param external_id [String] This is the external ID of the customer.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateWebCustomerDto]
    def initialize(number_e_164_check_enabled: OMIT, extension: OMIT, assistant_overrides: OMIT, number: OMIT,
                   sip_uri: OMIT, name: OMIT, email: OMIT, external_id: OMIT, additional_properties: nil)
      @number_e_164_check_enabled = number_e_164_check_enabled if number_e_164_check_enabled != OMIT
      @extension = extension if extension != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @number = number if number != OMIT
      @sip_uri = sip_uri if sip_uri != OMIT
      @name = name if name != OMIT
      @email = email if email != OMIT
      @external_id = external_id if external_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "numberE164CheckEnabled": number_e_164_check_enabled,
        "extension": extension,
        "assistantOverrides": assistant_overrides,
        "number": number,
        "sipUri": sip_uri,
        "name": name,
        "email": email,
        "externalId": external_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateWebCustomerDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateWebCustomerDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      number_e_164_check_enabled = parsed_json["numberE164CheckEnabled"]
      extension = parsed_json["extension"]
      if parsed_json["assistantOverrides"].nil?
        assistant_overrides = nil
      else
        assistant_overrides = parsed_json["assistantOverrides"].to_json
        assistant_overrides = Vapi::ChatAssistantOverrides.from_json(json_object: assistant_overrides)
      end
      number = parsed_json["number"]
      sip_uri = parsed_json["sipUri"]
      name = parsed_json["name"]
      email = parsed_json["email"]
      external_id = parsed_json["externalId"]
      new(
        number_e_164_check_enabled: number_e_164_check_enabled,
        extension: extension,
        assistant_overrides: assistant_overrides,
        number: number,
        sip_uri: sip_uri,
        name: name,
        email: email,
        external_id: external_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateWebCustomerDto to a JSON object
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
      obj.number_e_164_check_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.number_e_164_check_enabled is not the expected type, validation failed.")
      obj.extension&.is_a?(String) != false || raise("Passed value for field obj.extension is not the expected type, validation failed.")
      obj.assistant_overrides.nil? || Vapi::ChatAssistantOverrides.validate_raw(obj: obj.assistant_overrides)
      obj.number&.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
      obj.sip_uri&.is_a?(String) != false || raise("Passed value for field obj.sip_uri is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
    end
  end
end
