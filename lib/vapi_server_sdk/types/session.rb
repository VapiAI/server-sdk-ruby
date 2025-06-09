# frozen_string_literal: true
require "date"
require "date"
require_relative "session_status"
require_relative "create_assistant_dto"
require_relative "session_messages_item"
require_relative "create_customer_dto"
require_relative "import_twilio_phone_number_dto"
require "ostruct"
require "json"

module Vapi
  class Session
  # @return [String] This is the unique identifier for the session.
    attr_reader :id
  # @return [String] This is the unique identifier for the organization that owns this session.
    attr_reader :org_id
  # @return [DateTime] This is the ISO 8601 timestamp indicating when the session was created.
    attr_reader :created_at
  # @return [DateTime] This is the ISO 8601 timestamp indicating when the session was last updated.
    attr_reader :updated_at
  # @return [String] This is a user-defined name for the session. Maximum length is 40 characters.
    attr_reader :name
  # @return [Vapi::SessionStatus] This is the current status of the session. Can be either 'active' or
#  'completed'.
    attr_reader :status
  # @return [Float] Session expiration time in seconds. Defaults to 24 hours (86400 seconds) if not
#  set.
    attr_reader :expiration_seconds
  # @return [String] This is the ID of the assistant associated with this session. Use this when
#  referencing an existing assistant.
    attr_reader :assistant_id
  # @return [Vapi::CreateAssistantDto] This is the assistant configuration for this session. Use this when creating a
#  new assistant configuration.
#  If assistantId is provided, this will be ignored.
    attr_reader :assistant
  # @return [Array<Vapi::SessionMessagesItem>] This is an array of chat messages in the session.
    attr_reader :messages
  # @return [Vapi::CreateCustomerDto] This is the customer information associated with this session.
    attr_reader :customer
  # @return [String] This is the ID of the phone number associated with this session.
    attr_reader :phone_number_id
  # @return [Vapi::ImportTwilioPhoneNumberDto] This is the phone number configuration for this session.
    attr_reader :phone_number
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] This is the unique identifier for the session.
    # @param org_id [String] This is the unique identifier for the organization that owns this session.
    # @param created_at [DateTime] This is the ISO 8601 timestamp indicating when the session was created.
    # @param updated_at [DateTime] This is the ISO 8601 timestamp indicating when the session was last updated.
    # @param name [String] This is a user-defined name for the session. Maximum length is 40 characters.
    # @param status [Vapi::SessionStatus] This is the current status of the session. Can be either 'active' or
#  'completed'.
    # @param expiration_seconds [Float] Session expiration time in seconds. Defaults to 24 hours (86400 seconds) if not
#  set.
    # @param assistant_id [String] This is the ID of the assistant associated with this session. Use this when
#  referencing an existing assistant.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant configuration for this session. Use this when creating a
#  new assistant configuration.
#  If assistantId is provided, this will be ignored.
    # @param messages [Array<Vapi::SessionMessagesItem>] This is an array of chat messages in the session.
    # @param customer [Vapi::CreateCustomerDto] This is the customer information associated with this session.
    # @param phone_number_id [String] This is the ID of the phone number associated with this session.
    # @param phone_number [Vapi::ImportTwilioPhoneNumberDto] This is the phone number configuration for this session.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Session]
    def initialize(id:, org_id:, created_at:, updated_at:, name: OMIT, status: OMIT, expiration_seconds: OMIT, assistant_id: OMIT, assistant: OMIT, messages: OMIT, customer: OMIT, phone_number_id: OMIT, phone_number: OMIT, additional_properties: nil)
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name if name != OMIT
      @status = status if status != OMIT
      @expiration_seconds = expiration_seconds if expiration_seconds != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @assistant = assistant if assistant != OMIT
      @messages = messages if messages != OMIT
      @customer = customer if customer != OMIT
      @phone_number_id = phone_number_id if phone_number_id != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "orgId": org_id, "createdAt": created_at, "updatedAt": updated_at, "name": name, "status": status, "expirationSeconds": expiration_seconds, "assistantId": assistant_id, "assistant": assistant, "messages": messages, "customer": customer, "phoneNumberId": phone_number_id, "phoneNumber": phone_number }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Session
    #
    # @param json_object [String] 
    # @return [Vapi::Session]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
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
      name = parsed_json["name"]
      status = parsed_json["status"]
      expiration_seconds = parsed_json["expirationSeconds"]
      assistant_id = parsed_json["assistantId"]
      unless parsed_json["assistant"].nil?
        assistant = parsed_json["assistant"].to_json
        assistant = Vapi::CreateAssistantDto.from_json(json_object: assistant)
      else
        assistant = nil
      end
      messages = parsed_json["messages"]&.map do | item |
  item = item.to_json
  Vapi::SessionMessagesItem.from_json(json_object: item)
end
      unless parsed_json["customer"].nil?
        customer = parsed_json["customer"].to_json
        customer = Vapi::CreateCustomerDto.from_json(json_object: customer)
      else
        customer = nil
      end
      phone_number_id = parsed_json["phoneNumberId"]
      unless parsed_json["phoneNumber"].nil?
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ImportTwilioPhoneNumberDto.from_json(json_object: phone_number)
      else
        phone_number = nil
      end
      new(
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        status: status,
        expiration_seconds: expiration_seconds,
        assistant_id: assistant_id,
        assistant: assistant,
        messages: messages,
        customer: customer,
        phone_number_id: phone_number_id,
        phone_number: phone_number,
        additional_properties: struct
      )
    end
# Serialize an instance of Session to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.status&.is_a?(Vapi::SessionStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.expiration_seconds&.is_a?(Float) != false || raise("Passed value for field obj.expiration_seconds is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.phone_number_id&.is_a?(String) != false || raise("Passed value for field obj.phone_number_id is not the expected type, validation failed.")
      obj.phone_number.nil? || Vapi::ImportTwilioPhoneNumberDto.validate_raw(obj: obj.phone_number)
    end
  end
end