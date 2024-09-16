# frozen_string_literal: true

require_relative "server_message_end_of_call_report_phone_number"
require_relative "server_message_end_of_call_report_ended_reason"
require_relative "server_message_end_of_call_report_costs_item"
require_relative "artifact"
require_relative "create_assistant_dto"
require_relative "create_customer_dto"
require_relative "call"
require_relative "analysis"
require "date"
require "ostruct"
require "json"

module Vapi
  class ServerMessageEndOfCallReport
    # @return [Vapi::ServerMessageEndOfCallReportPhoneNumber] This is the phone number associated with the call.
    #  This matches one of the following:
    #  - `call.phoneNumber`,
    #  - `call.phoneNumberId`.
    attr_reader :phone_number
    # @return [Vapi::ServerMessageEndOfCallReportEndedReason] This is the reason the call ended. This can also be found at `call.endedReason`
    #  on GET /call/:id.
    attr_reader :ended_reason
    # @return [Float] This is the cost of the call in USD. This can also be found at `call.cost` on
    #  GET /call/:id.
    attr_reader :cost
    # @return [Array<Vapi::ServerMessageEndOfCallReportCostsItem>] These are the costs of individual components of the call in USD. This can also
    #  be found at `call.costs` on GET /call/:id.
    attr_reader :costs
    # @return [String] This is the ISO-8601 formatted timestamp of when the message was sent.
    attr_reader :timestamp
    # @return [Vapi::Artifact] These are the artifacts from the call. This can also be found at `call.artifact`
    #  on GET /call/:id.
    attr_reader :artifact
    # @return [Vapi::CreateAssistantDto] This is the assistant that is currently active. This is provided for
    #  convenience.
    #  This matches one of the following:
    #  - `call.assistant`,
    #  - `call.assistantId`,
    #  - `call.squad[n].assistant`,
    #  - `call.squad[n].assistantId`,
    #  - `call.squadId->[n].assistant`,
    #  - `call.squadId->[n].assistantId`.
    attr_reader :assistant
    # @return [Vapi::CreateCustomerDto] This is the customer associated with the call.
    #  This matches one of the following:
    #  - `call.customer`,
    #  - `call.customerId`.
    attr_reader :customer
    # @return [Vapi::Call] This is the call object.
    #  This matches what was returned in POST /call.
    #  Note: This might get stale during the call. To get the latest call object,
    #  especially after the call is ended, use GET /call/:id.
    attr_reader :call
    # @return [Vapi::Analysis] This is the analysis of the call. This can also be found at `call.analysis` on
    #  GET /call/:id.
    attr_reader :analysis
    # @return [DateTime] This is the ISO 8601 date-time string of when the call started. This can also be
    #  found at `call.startedAt` on GET /call/:id.
    attr_reader :started_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the call ended. This can also be
    #  found at `call.endedAt` on GET /call/:id.
    attr_reader :ended_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param phone_number [Vapi::ServerMessageEndOfCallReportPhoneNumber] This is the phone number associated with the call.
    #  This matches one of the following:
    #  - `call.phoneNumber`,
    #  - `call.phoneNumberId`.
    # @param ended_reason [Vapi::ServerMessageEndOfCallReportEndedReason] This is the reason the call ended. This can also be found at `call.endedReason`
    #  on GET /call/:id.
    # @param cost [Float] This is the cost of the call in USD. This can also be found at `call.cost` on
    #  GET /call/:id.
    # @param costs [Array<Vapi::ServerMessageEndOfCallReportCostsItem>] These are the costs of individual components of the call in USD. This can also
    #  be found at `call.costs` on GET /call/:id.
    # @param timestamp [String] This is the ISO-8601 formatted timestamp of when the message was sent.
    # @param artifact [Vapi::Artifact] These are the artifacts from the call. This can also be found at `call.artifact`
    #  on GET /call/:id.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that is currently active. This is provided for
    #  convenience.
    #  This matches one of the following:
    #  - `call.assistant`,
    #  - `call.assistantId`,
    #  - `call.squad[n].assistant`,
    #  - `call.squad[n].assistantId`,
    #  - `call.squadId->[n].assistant`,
    #  - `call.squadId->[n].assistantId`.
    # @param customer [Vapi::CreateCustomerDto] This is the customer associated with the call.
    #  This matches one of the following:
    #  - `call.customer`,
    #  - `call.customerId`.
    # @param call [Vapi::Call] This is the call object.
    #  This matches what was returned in POST /call.
    #  Note: This might get stale during the call. To get the latest call object,
    #  especially after the call is ended, use GET /call/:id.
    # @param analysis [Vapi::Analysis] This is the analysis of the call. This can also be found at `call.analysis` on
    #  GET /call/:id.
    # @param started_at [DateTime] This is the ISO 8601 date-time string of when the call started. This can also be
    #  found at `call.startedAt` on GET /call/:id.
    # @param ended_at [DateTime] This is the ISO 8601 date-time string of when the call ended. This can also be
    #  found at `call.endedAt` on GET /call/:id.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ServerMessageEndOfCallReport]
    def initialize(ended_reason:, artifact:, analysis:, phone_number: OMIT, cost: OMIT, costs: OMIT, timestamp: OMIT,
                   assistant: OMIT, customer: OMIT, call: OMIT, started_at: OMIT, ended_at: OMIT, additional_properties: nil)
      @phone_number = phone_number if phone_number != OMIT
      @ended_reason = ended_reason
      @cost = cost if cost != OMIT
      @costs = costs if costs != OMIT
      @timestamp = timestamp if timestamp != OMIT
      @artifact = artifact
      @assistant = assistant if assistant != OMIT
      @customer = customer if customer != OMIT
      @call = call if call != OMIT
      @analysis = analysis
      @started_at = started_at if started_at != OMIT
      @ended_at = ended_at if ended_at != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "phoneNumber": phone_number,
        "endedReason": ended_reason,
        "cost": cost,
        "costs": costs,
        "timestamp": timestamp,
        "artifact": artifact,
        "assistant": assistant,
        "customer": customer,
        "call": call,
        "analysis": analysis,
        "startedAt": started_at,
        "endedAt": ended_at
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ServerMessageEndOfCallReport
    #
    # @param json_object [String]
    # @return [Vapi::ServerMessageEndOfCallReport]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["phoneNumber"].nil?
        phone_number = nil
      else
        phone_number = parsed_json["phoneNumber"].to_json
        phone_number = Vapi::ServerMessageEndOfCallReportPhoneNumber.from_json(json_object: phone_number)
      end
      ended_reason = parsed_json["endedReason"]
      cost = parsed_json["cost"]
      costs = parsed_json["costs"]&.map do |item|
        item = item.to_json
        Vapi::ServerMessageEndOfCallReportCostsItem.from_json(json_object: item)
      end
      timestamp = parsed_json["timestamp"]
      if parsed_json["artifact"].nil?
        artifact = nil
      else
        artifact = parsed_json["artifact"].to_json
        artifact = Vapi::Artifact.from_json(json_object: artifact)
      end
      if parsed_json["assistant"].nil?
        assistant = nil
      else
        assistant = parsed_json["assistant"].to_json
        assistant = Vapi::CreateAssistantDto.from_json(json_object: assistant)
      end
      if parsed_json["customer"].nil?
        customer = nil
      else
        customer = parsed_json["customer"].to_json
        customer = Vapi::CreateCustomerDto.from_json(json_object: customer)
      end
      if parsed_json["call"].nil?
        call = nil
      else
        call = parsed_json["call"].to_json
        call = Vapi::Call.from_json(json_object: call)
      end
      if parsed_json["analysis"].nil?
        analysis = nil
      else
        analysis = parsed_json["analysis"].to_json
        analysis = Vapi::Analysis.from_json(json_object: analysis)
      end
      started_at = (DateTime.parse(parsed_json["startedAt"]) unless parsed_json["startedAt"].nil?)
      ended_at = (DateTime.parse(parsed_json["endedAt"]) unless parsed_json["endedAt"].nil?)
      new(
        phone_number: phone_number,
        ended_reason: ended_reason,
        cost: cost,
        costs: costs,
        timestamp: timestamp,
        artifact: artifact,
        assistant: assistant,
        customer: customer,
        call: call,
        analysis: analysis,
        started_at: started_at,
        ended_at: ended_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of ServerMessageEndOfCallReport to a JSON object
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
      obj.phone_number.nil? || Vapi::ServerMessageEndOfCallReportPhoneNumber.validate_raw(obj: obj.phone_number)
      obj.ended_reason.is_a?(Vapi::ServerMessageEndOfCallReportEndedReason) != false || raise("Passed value for field obj.ended_reason is not the expected type, validation failed.")
      obj.cost&.is_a?(Float) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
      obj.costs&.is_a?(Array) != false || raise("Passed value for field obj.costs is not the expected type, validation failed.")
      obj.timestamp&.is_a?(String) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      Vapi::Artifact.validate_raw(obj: obj.artifact)
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.customer.nil? || Vapi::CreateCustomerDto.validate_raw(obj: obj.customer)
      obj.call.nil? || Vapi::Call.validate_raw(obj: obj.call)
      Vapi::Analysis.validate_raw(obj: obj.analysis)
      obj.started_at&.is_a?(DateTime) != false || raise("Passed value for field obj.started_at is not the expected type, validation failed.")
      obj.ended_at&.is_a?(DateTime) != false || raise("Passed value for field obj.ended_at is not the expected type, validation failed.")
    end
  end
end
