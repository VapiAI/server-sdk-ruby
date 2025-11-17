# frozen_string_literal: true

require "date"
require_relative "session_costs_item"
require_relative "session_status"
require_relative "create_assistant_dto"
require_relative "create_squad_dto"
require_relative "session_messages_item"
require_relative "create_customer_dto"
require_relative "import_twilio_phone_number_dto"
require_relative "artifact"
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
    # @return [Float] This is the cost of the session in USD.
    attr_reader :cost
    # @return [Array<Vapi::SessionCostsItem>] These are the costs of individual components of the session in USD.
    attr_reader :costs
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
    # @return [String] This is the squad ID associated with this session. Use this when referencing an
    #  existing squad.
    attr_reader :squad_id
    # @return [Vapi::CreateSquadDto] This is the squad configuration for this session. Use this when creating a new
    #  squad configuration.
    #  If squadId is provided, this will be ignored.
    attr_reader :squad
    # @return [Array<Vapi::SessionMessagesItem>] This is an array of chat messages in the session.
    attr_reader :messages
    # @return [Vapi::CreateCustomerDto] This is the customer information associated with this session.
    attr_reader :customer
    # @return [String] This is the ID of the phone number associated with this session.
    attr_reader :phone_number_id
    # @return [Vapi::ImportTwilioPhoneNumberDto] This is the phone number configuration for this session.
    attr_reader :phone_number
    # @return [Vapi::Artifact] These are the artifacts that were extracted from the session messages.
    #  They are only available after the session has completed.
    #  The artifact plan from the assistant or active assistant of squad is used to
    #  generate the artifact.
    #  Currently the only supported fields of assistant artifact plan are:
    #  - structuredOutputIds
    attr_reader :artifact
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
    # @param cost [Float] This is the cost of the session in USD.
    # @param costs [Array<Vapi::SessionCostsItem>] These are the costs of individual components of the session in USD.
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
    # @param squad_id [String] This is the squad ID associated with this session. Use this when referencing an
    #  existing squad.
    # @param squad [Vapi::CreateSquadDto] This is the squad configuration for this session. Use this when creating a new
    #  squad configuration.
    #  If squadId is provided, this will be ignored.
    # @param messages [Array<Vapi::SessionMessagesItem>] This is an array of chat messages in the session.
    # @param customer [Vapi::CreateCustomerDto] This is the customer information associated with this session.
    # @param phone_number_id [String] This is the ID of the phone number associated with this session.
    # @param phone_number [Vapi::ImportTwilioPhoneNumberDto] This is the phone number configuration for this session.
    # @param artifact [Vapi::Artifact] These are the artifacts that were extracted from the session messages.
    #  They are only available after the session has completed.
    #  The artifact plan from the assistant or active assistant of squad is used to
    #  generate the artifact.
    #  Currently the only supported fields of assistant artifact plan are:
    #  - structuredOutputIds
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Session]
    def initialize(id:, org_id:, created_at:, updated_at:, cost: OMIT, costs: OMIT, name: OMIT, status: OMIT,
                   expiration_seconds: OMIT, assistant_id: OMIT, assistant: OMIT, squad_id: OMIT, squad: OMIT, messages: OMIT, customer: OMIT, phone_number_id: OMIT, phone_number: OMIT, artifact: OMIT, additional_properties: nil)
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @cost = cost if cost != OMIT
      @costs = costs if costs != OMIT
      @name = name if name != OMIT
      @status = status if status != OMIT
      @expiration_seconds = expiration_seconds if expiration_seconds != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @assistant = assistant if assistant != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @squad = squad if squad != OMIT
      @messages = messages if messages != OMIT
      @customer = customer if customer != OMIT
      @phone_number_id = phone_number_id if phone_number_id != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @artifact = artifact if artifact != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "cost": cost,
        "costs": costs,
        "name": name,
        "status": status,
        "expirationSeconds": expiration_seconds,
        "assistantId": assistant_id,
        "assistant": assistant,
        "squadId": squad_id,
        "squad": squad,
        "messages": messages,
        "customer": customer,
        "phoneNumberId": phone_number_id,
        "phoneNumber": phone_number,
        "artifact": artifact
      }.reject do |_k, v|
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
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      cost = parsed_json["cost"]
      costs = parsed_json["costs"]&.map do |item|
        item = item.to_json
        Vapi::SessionCostsItem.from_json(json_object: item)
      end
      name = parsed_json["name"]
      status = parsed_json["status"]
      expiration_seconds = parsed_json["expirationSeconds"]
      assistant_id = parsed_json["assistantId"]
      if parsed_json["assistant"].nil?
        assistant = nil
      else
        assistant = parsed_json["assistant"].to_json
        assistant = Vapi::CreateAssistantDto.from_json(json_object: assistant)
      end
      squad_id = parsed_json["squadId"]
      if parsed_json["squad"].nil?
        squad = nil
      else
        squad = parsed_json["squad"].to_json
        squad = Vapi::CreateSquadDto.from_json(json_object: squad)
      end
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::SessionMessagesItem.from_json(json_object: item)
      end
      if parsed_json["customer"].nil?
        customer = nil
      else
        customer = parsed_json["customer"].to_json
        customer = Vapi::CreateCustomerDto.from_json(json_object: customer)
      end
      phone_number_id = parsed_json["phoneNumberId"]
      if parsed_json["phoneNumber"].nil?
        phone_number = nil
      else
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ImportTwilioPhoneNumberDto.from_json(json_object: phone_number)
      end
      if parsed_json["artifact"].nil?
        artifact = nil
      else
        artifact = parsed_json["artifact"].to_json
        artifact = Vapi::Artifact.from_json(json_object: artifact)
      end
      new(
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        cost: cost,
        costs: costs,
        name: name,
        status: status,
        expiration_seconds: expiration_seconds,
        assistant_id: assistant_id,
        assistant: assistant,
        squad_id: squad_id,
        squad: squad,
        messages: messages,
        customer: customer,
        phone_number_id: phone_number_id,
        phone_number: phone_number,
        artifact: artifact,
        additional_properties: struct
      )
    end

    # Serialize an instance of Session to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.cost&.is_a?(Float) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
      obj.costs&.is_a?(Array) != false || raise("Passed value for field obj.costs is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.status&.is_a?(Vapi::SessionStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.expiration_seconds&.is_a?(Float) != false || raise("Passed value for field obj.expiration_seconds is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.squad.nil? || Vapi::CreateSquadDto.validate_raw(obj: obj.squad)
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.phone_number_id&.is_a?(String) != false || raise("Passed value for field obj.phone_number_id is not the expected type, validation failed.")
      obj.phone_number.nil? || Vapi::ImportTwilioPhoneNumberDto.validate_raw(obj: obj.phone_number)
      obj.artifact.nil? || Vapi::Artifact.validate_raw(obj: obj.artifact)
    end
  end
end
