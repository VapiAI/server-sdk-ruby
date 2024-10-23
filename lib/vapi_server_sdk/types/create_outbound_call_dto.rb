# frozen_string_literal: true

require_relative "create_assistant_dto"
require_relative "assistant_overrides"
require_relative "create_squad_dto"
require_relative "import_twilio_phone_number_dto"
require_relative "create_customer_dto"
require "ostruct"
require "json"

module Vapi
  class CreateOutboundCallDto
    # @return [String] This is the name of the call. This is just for your own reference.
    attr_reader :name
    # @return [String] This is the assistant that will be used for the call. To use a transient
    #  assistant, use `assistant` instead.
    attr_reader :assistant_id
    # @return [Vapi::CreateAssistantDto] This is the assistant that will be used for the call. To use an existing
    #  assistant, use `assistantId` instead.
    attr_reader :assistant
    # @return [Vapi::AssistantOverrides] These are the overrides for the `assistant` or `assistantId`'s settings and
    #  template variables.
    attr_reader :assistant_overrides
    # @return [String] This is the squad that will be used for the call. To use a transient squad, use
    #  `squad` instead.
    attr_reader :squad_id
    # @return [Vapi::CreateSquadDto] This is a squad that will be used for the call. To use an existing squad, use
    #  `squadId` instead.
    attr_reader :squad
    # @return [String] This is the phone number that will be used for the call. To use a transient
    #  number, use `phoneNumber` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    attr_reader :phone_number_id
    # @return [Vapi::ImportTwilioPhoneNumberDto] This is the phone number that will be used for the call. To use an existing
    #  number, use `phoneNumberId` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    attr_reader :phone_number
    # @return [String] This is the customer that will be called. To call a transient customer , use
    #  `customer` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    attr_reader :customer_id
    # @return [Vapi::CreateCustomerDto] This is the customer that will be called. To call an existing customer, use
    #  `customerId` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    attr_reader :customer
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of the call. This is just for your own reference.
    # @param assistant_id [String] This is the assistant that will be used for the call. To use a transient
    #  assistant, use `assistant` instead.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that will be used for the call. To use an existing
    #  assistant, use `assistantId` instead.
    # @param assistant_overrides [Vapi::AssistantOverrides] These are the overrides for the `assistant` or `assistantId`'s settings and
    #  template variables.
    # @param squad_id [String] This is the squad that will be used for the call. To use a transient squad, use
    #  `squad` instead.
    # @param squad [Vapi::CreateSquadDto] This is a squad that will be used for the call. To use an existing squad, use
    #  `squadId` instead.
    # @param phone_number_id [String] This is the phone number that will be used for the call. To use a transient
    #  number, use `phoneNumber` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    # @param phone_number [Vapi::ImportTwilioPhoneNumberDto] This is the phone number that will be used for the call. To use an existing
    #  number, use `phoneNumberId` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    # @param customer_id [String] This is the customer that will be called. To call a transient customer , use
    #  `customer` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    # @param customer [Vapi::CreateCustomerDto] This is the customer that will be called. To call an existing customer, use
    #  `customerId` instead.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateOutboundCallDto]
    def initialize(name: OMIT, assistant_id: OMIT, assistant: OMIT, assistant_overrides: OMIT, squad_id: OMIT,
                   squad: OMIT, phone_number_id: OMIT, phone_number: OMIT, customer_id: OMIT, customer: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @assistant = assistant if assistant != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @squad = squad if squad != OMIT
      @phone_number_id = phone_number_id if phone_number_id != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @customer_id = customer_id if customer_id != OMIT
      @customer = customer if customer != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "name": name,
        "assistantId": assistant_id,
        "assistant": assistant,
        "assistantOverrides": assistant_overrides,
        "squadId": squad_id,
        "squad": squad,
        "phoneNumberId": phone_number_id,
        "phoneNumber": phone_number,
        "customerId": customer_id,
        "customer": customer
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateOutboundCallDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateOutboundCallDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      assistant_id = parsed_json["assistantId"]
      if parsed_json["assistant"].nil?
        assistant = nil
      else
        assistant = parsed_json["assistant"].to_json
        assistant = Vapi::CreateAssistantDto.from_json(json_object: assistant)
      end
      if parsed_json["assistantOverrides"].nil?
        assistant_overrides = nil
      else
        assistant_overrides = parsed_json["assistantOverrides"].to_json
        assistant_overrides = Vapi::AssistantOverrides.from_json(json_object: assistant_overrides)
      end
      squad_id = parsed_json["squadId"]
      if parsed_json["squad"].nil?
        squad = nil
      else
        squad = parsed_json["squad"].to_json
        squad = Vapi::CreateSquadDto.from_json(json_object: squad)
      end
      phone_number_id = parsed_json["phoneNumberId"]
      if parsed_json["phoneNumber"].nil?
        phone_number = nil
      else
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ImportTwilioPhoneNumberDto.from_json(json_object: phone_number)
      end
      customer_id = parsed_json["customerId"]
      if parsed_json["customer"].nil?
        customer = nil
      else
        customer = parsed_json["customer"].to_json
        customer = Vapi::CreateCustomerDto.from_json(json_object: customer)
      end
      new(
        name: name,
        assistant_id: assistant_id,
        assistant: assistant,
        assistant_overrides: assistant_overrides,
        squad_id: squad_id,
        squad: squad,
        phone_number_id: phone_number_id,
        phone_number: phone_number,
        customer_id: customer_id,
        customer: customer,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateOutboundCallDto to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.assistant_overrides.nil? || Vapi::AssistantOverrides.validate_raw(obj: obj.assistant_overrides)
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.squad.nil? || Vapi::CreateSquadDto.validate_raw(obj: obj.squad)
      obj.phone_number_id&.is_a?(String) != false || raise("Passed value for field obj.phone_number_id is not the expected type, validation failed.")
      obj.phone_number.nil? || Vapi::ImportTwilioPhoneNumberDto.validate_raw(obj: obj.phone_number)
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
    end
  end
end
