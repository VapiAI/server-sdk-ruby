# frozen_string_literal: true

require_relative "call_type"
require_relative "call_costs_item"
require_relative "call_messages_item"
require_relative "call_phone_call_provider"
require_relative "call_phone_call_transport"
require_relative "call_status"
require_relative "call_ended_reason"
require_relative "call_destination"
require "date"
require_relative "cost_breakdown"
require_relative "artifact_plan"
require_relative "analysis"
require_relative "monitor"
require_relative "artifact"
require_relative "transport"
require_relative "create_assistant_dto"
require_relative "assistant_overrides"
require_relative "create_squad_dto"
require_relative "import_twilio_phone_number_dto"
require_relative "create_customer_dto"
require "ostruct"
require "json"

module Vapi
  class Call
    # @return [Vapi::CallType] This is the type of call.
    attr_reader :type
    # @return [Array<Vapi::CallCostsItem>] These are the costs of individual components of the call in USD.
    attr_reader :costs
    # @return [Array<Vapi::CallMessagesItem>]
    attr_reader :messages
    # @return [Vapi::CallPhoneCallProvider] This is the provider of the call.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    attr_reader :phone_call_provider
    # @return [Vapi::CallPhoneCallTransport] This is the transport of the phone call.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    attr_reader :phone_call_transport
    # @return [Vapi::CallStatus] This is the status of the call.
    attr_reader :status
    # @return [Vapi::CallEndedReason] This is the explanation for how the call ended.
    attr_reader :ended_reason
    # @return [Vapi::CallDestination] This is the destination where the call ended up being transferred to. If the
    #  call was not transferred, this will be empty.
    attr_reader :destination
    # @return [String] This is the unique identifier for the call.
    attr_reader :id
    # @return [String] This is the unique identifier for the org that this call belongs to.
    attr_reader :org_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the call was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the call was last updated.
    attr_reader :updated_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the call was started.
    attr_reader :started_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the call was ended.
    attr_reader :ended_at
    # @return [Float] This is the cost of the call in USD.
    attr_reader :cost
    # @return [Vapi::CostBreakdown] This is the cost of the call in USD.
    attr_reader :cost_breakdown
    # @return [Vapi::ArtifactPlan] This is a copy of assistant artifact plan. This isn't actually stored on the
    #  call but rather just returned in POST /call/web to enable artifact creation
    #  client side.
    attr_reader :artifact_plan
    # @return [Vapi::Analysis] This is the analysis of the call. Configure in `assistant.analysisPlan`.
    attr_reader :analysis
    # @return [Vapi::Monitor] This is to real-time monitor the call. Configure in `assistant.monitorPlan`.
    attr_reader :monitor
    # @return [Vapi::Artifact] These are the artifacts created from the call. Configure in
    #  `assistant.artifactPlan`.
    attr_reader :artifact
    # @return [Vapi::Transport] This is the transport used for the call.
    attr_reader :transport
    # @return [String] The ID of the call as provided by the phone number service. callSid in Twilio.
    #  conversationUuid in Vonage.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    attr_reader :phone_call_provider_id
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
    # @return [String] This is the name of the call. This is just for your own reference.
    attr_reader :name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Vapi::CallType] This is the type of call.
    # @param costs [Array<Vapi::CallCostsItem>] These are the costs of individual components of the call in USD.
    # @param messages [Array<Vapi::CallMessagesItem>]
    # @param phone_call_provider [Vapi::CallPhoneCallProvider] This is the provider of the call.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    # @param phone_call_transport [Vapi::CallPhoneCallTransport] This is the transport of the phone call.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
    # @param status [Vapi::CallStatus] This is the status of the call.
    # @param ended_reason [Vapi::CallEndedReason] This is the explanation for how the call ended.
    # @param destination [Vapi::CallDestination] This is the destination where the call ended up being transferred to. If the
    #  call was not transferred, this will be empty.
    # @param id [String] This is the unique identifier for the call.
    # @param org_id [String] This is the unique identifier for the org that this call belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the call was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the call was last updated.
    # @param started_at [DateTime] This is the ISO 8601 date-time string of when the call was started.
    # @param ended_at [DateTime] This is the ISO 8601 date-time string of when the call was ended.
    # @param cost [Float] This is the cost of the call in USD.
    # @param cost_breakdown [Vapi::CostBreakdown] This is the cost of the call in USD.
    # @param artifact_plan [Vapi::ArtifactPlan] This is a copy of assistant artifact plan. This isn't actually stored on the
    #  call but rather just returned in POST /call/web to enable artifact creation
    #  client side.
    # @param analysis [Vapi::Analysis] This is the analysis of the call. Configure in `assistant.analysisPlan`.
    # @param monitor [Vapi::Monitor] This is to real-time monitor the call. Configure in `assistant.monitorPlan`.
    # @param artifact [Vapi::Artifact] These are the artifacts created from the call. Configure in
    #  `assistant.artifactPlan`.
    # @param transport [Vapi::Transport] This is the transport used for the call.
    # @param phone_call_provider_id [String] The ID of the call as provided by the phone number service. callSid in Twilio.
    #  conversationUuid in Vonage.
    #  Only relevant for `outboundPhoneCall` and `inboundPhoneCall` type.
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
    # @param name [String] This is the name of the call. This is just for your own reference.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Call]
    def initialize(id:, org_id:, created_at:, updated_at:, type: OMIT, costs: OMIT, messages: OMIT, phone_call_provider: OMIT, phone_call_transport: OMIT,
                   status: OMIT, ended_reason: OMIT, destination: OMIT, started_at: OMIT, ended_at: OMIT, cost: OMIT, cost_breakdown: OMIT, artifact_plan: OMIT, analysis: OMIT, monitor: OMIT, artifact: OMIT, transport: OMIT, phone_call_provider_id: OMIT, assistant_id: OMIT, assistant: OMIT, assistant_overrides: OMIT, squad_id: OMIT, squad: OMIT, phone_number_id: OMIT, phone_number: OMIT, customer_id: OMIT, customer: OMIT, name: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @costs = costs if costs != OMIT
      @messages = messages if messages != OMIT
      @phone_call_provider = phone_call_provider if phone_call_provider != OMIT
      @phone_call_transport = phone_call_transport if phone_call_transport != OMIT
      @status = status if status != OMIT
      @ended_reason = ended_reason if ended_reason != OMIT
      @destination = destination if destination != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @started_at = started_at if started_at != OMIT
      @ended_at = ended_at if ended_at != OMIT
      @cost = cost if cost != OMIT
      @cost_breakdown = cost_breakdown if cost_breakdown != OMIT
      @artifact_plan = artifact_plan if artifact_plan != OMIT
      @analysis = analysis if analysis != OMIT
      @monitor = monitor if monitor != OMIT
      @artifact = artifact if artifact != OMIT
      @transport = transport if transport != OMIT
      @phone_call_provider_id = phone_call_provider_id if phone_call_provider_id != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @assistant = assistant if assistant != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @squad = squad if squad != OMIT
      @phone_number_id = phone_number_id if phone_number_id != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @customer_id = customer_id if customer_id != OMIT
      @customer = customer if customer != OMIT
      @name = name if name != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "type": type,
        "costs": costs,
        "messages": messages,
        "phoneCallProvider": phone_call_provider,
        "phoneCallTransport": phone_call_transport,
        "status": status,
        "endedReason": ended_reason,
        "destination": destination,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "startedAt": started_at,
        "endedAt": ended_at,
        "cost": cost,
        "costBreakdown": cost_breakdown,
        "artifactPlan": artifact_plan,
        "analysis": analysis,
        "monitor": monitor,
        "artifact": artifact,
        "transport": transport,
        "phoneCallProviderId": phone_call_provider_id,
        "assistantId": assistant_id,
        "assistant": assistant,
        "assistantOverrides": assistant_overrides,
        "squadId": squad_id,
        "squad": squad,
        "phoneNumberId": phone_number_id,
        "phoneNumber": phone_number,
        "customerId": customer_id,
        "customer": customer,
        "name": name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Call
    #
    # @param json_object [String]
    # @return [Vapi::Call]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      costs = parsed_json["costs"]&.map do |item|
        item = item.to_json
        Vapi::CallCostsItem.from_json(json_object: item)
      end
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::CallMessagesItem.from_json(json_object: item)
      end
      phone_call_provider = parsed_json["phoneCallProvider"]
      phone_call_transport = parsed_json["phoneCallTransport"]
      status = parsed_json["status"]
      ended_reason = parsed_json["endedReason"]
      if parsed_json["destination"].nil?
        destination = nil
      else
        destination = parsed_json["destination"].to_json
        destination = Vapi::CallDestination.from_json(json_object: destination)
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      started_at = (DateTime.parse(parsed_json["startedAt"]) unless parsed_json["startedAt"].nil?)
      ended_at = (DateTime.parse(parsed_json["endedAt"]) unless parsed_json["endedAt"].nil?)
      cost = parsed_json["cost"]
      if parsed_json["costBreakdown"].nil?
        cost_breakdown = nil
      else
        cost_breakdown = parsed_json["costBreakdown"].to_json
        cost_breakdown = Vapi::CostBreakdown.from_json(json_object: cost_breakdown)
      end
      if parsed_json["artifactPlan"].nil?
        artifact_plan = nil
      else
        artifact_plan = parsed_json["artifactPlan"].to_json
        artifact_plan = Vapi::ArtifactPlan.from_json(json_object: artifact_plan)
      end
      if parsed_json["analysis"].nil?
        analysis = nil
      else
        analysis = parsed_json["analysis"].to_json
        analysis = Vapi::Analysis.from_json(json_object: analysis)
      end
      if parsed_json["monitor"].nil?
        monitor = nil
      else
        monitor = parsed_json["monitor"].to_json
        monitor = Vapi::Monitor.from_json(json_object: monitor)
      end
      if parsed_json["artifact"].nil?
        artifact = nil
      else
        artifact = parsed_json["artifact"].to_json
        artifact = Vapi::Artifact.from_json(json_object: artifact)
      end
      if parsed_json["transport"].nil?
        transport = nil
      else
        transport = parsed_json["transport"].to_json
        transport = Vapi::Transport.from_json(json_object: transport)
      end
      phone_call_provider_id = parsed_json["phoneCallProviderId"]
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
      name = parsed_json["name"]
      new(
        type: type,
        costs: costs,
        messages: messages,
        phone_call_provider: phone_call_provider,
        phone_call_transport: phone_call_transport,
        status: status,
        ended_reason: ended_reason,
        destination: destination,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        started_at: started_at,
        ended_at: ended_at,
        cost: cost,
        cost_breakdown: cost_breakdown,
        artifact_plan: artifact_plan,
        analysis: analysis,
        monitor: monitor,
        artifact: artifact,
        transport: transport,
        phone_call_provider_id: phone_call_provider_id,
        assistant_id: assistant_id,
        assistant: assistant,
        assistant_overrides: assistant_overrides,
        squad_id: squad_id,
        squad: squad,
        phone_number_id: phone_number_id,
        phone_number: phone_number,
        customer_id: customer_id,
        customer: customer,
        name: name,
        additional_properties: struct
      )
    end

    # Serialize an instance of Call to a JSON object
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
      obj.type&.is_a?(Vapi::CallType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.costs&.is_a?(Array) != false || raise("Passed value for field obj.costs is not the expected type, validation failed.")
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.phone_call_provider&.is_a?(Vapi::CallPhoneCallProvider) != false || raise("Passed value for field obj.phone_call_provider is not the expected type, validation failed.")
      obj.phone_call_transport&.is_a?(Vapi::CallPhoneCallTransport) != false || raise("Passed value for field obj.phone_call_transport is not the expected type, validation failed.")
      obj.status&.is_a?(Vapi::CallStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.ended_reason&.is_a?(Vapi::CallEndedReason) != false || raise("Passed value for field obj.ended_reason is not the expected type, validation failed.")
      obj.destination.nil? || Vapi::CallDestination.validate_raw(obj: obj.destination)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.started_at&.is_a?(DateTime) != false || raise("Passed value for field obj.started_at is not the expected type, validation failed.")
      obj.ended_at&.is_a?(DateTime) != false || raise("Passed value for field obj.ended_at is not the expected type, validation failed.")
      obj.cost&.is_a?(Float) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
      obj.cost_breakdown.nil? || Vapi::CostBreakdown.validate_raw(obj: obj.cost_breakdown)
      obj.artifact_plan.nil? || Vapi::ArtifactPlan.validate_raw(obj: obj.artifact_plan)
      obj.analysis.nil? || Vapi::Analysis.validate_raw(obj: obj.analysis)
      obj.monitor.nil? || Vapi::Monitor.validate_raw(obj: obj.monitor)
      obj.artifact.nil? || Vapi::Artifact.validate_raw(obj: obj.artifact)
      obj.transport.nil? || Vapi::Transport.validate_raw(obj: obj.transport)
      obj.phone_call_provider_id&.is_a?(String) != false || raise("Passed value for field obj.phone_call_provider_id is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.assistant_overrides.nil? || Vapi::AssistantOverrides.validate_raw(obj: obj.assistant_overrides)
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.squad.nil? || Vapi::CreateSquadDto.validate_raw(obj: obj.squad)
      obj.phone_number_id&.is_a?(String) != false || raise("Passed value for field obj.phone_number_id is not the expected type, validation failed.")
      obj.phone_number.nil? || Vapi::ImportTwilioPhoneNumberDto.validate_raw(obj: obj.phone_number)
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
