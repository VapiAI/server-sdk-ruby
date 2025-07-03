# frozen_string_literal: true
require_relative "campaign_status"
require_relative "campaign_ended_reason"
require_relative "schedule_plan"
require_relative "create_customer_dto"
require "date"
require "date"
require "ostruct"
require "json"

module Vapi
  class Campaign
  # @return [Vapi::CampaignStatus] This is the status of the campaign.
    attr_reader :status
  # @return [Vapi::CampaignEndedReason] This is the explanation for how the campaign ended.
    attr_reader :ended_reason
  # @return [String] This is the name of the campaign. This is just for your own reference.
    attr_reader :name
  # @return [String] This is the assistant ID that will be used for the campaign calls. Note: Either
#  assistantId or workflowId can be used, but not both.
    attr_reader :assistant_id
  # @return [String] This is the workflow ID that will be used for the campaign calls. Note: Either
#  assistantId or workflowId can be used, but not both.
    attr_reader :workflow_id
  # @return [String] This is the phone number ID that will be used for the campaign calls.
    attr_reader :phone_number_id
  # @return [Vapi::SchedulePlan] This is the schedule plan for the campaign.
    attr_reader :schedule_plan
  # @return [Array<Vapi::CreateCustomerDto>] These are the customers that will be called in the campaign.
    attr_reader :customers
  # @return [String] This is the unique identifier for the campaign.
    attr_reader :id
  # @return [String] This is the unique identifier for the org that this campaign belongs to.
    attr_reader :org_id
  # @return [DateTime] This is the ISO 8601 date-time string of when the campaign was created.
    attr_reader :created_at
  # @return [DateTime] This is the ISO 8601 date-time string of when the campaign was last updated.
    attr_reader :updated_at
  # @return [Hash{String => Object}] This is a map of call IDs to campaign call details.
    attr_reader :calls
  # @return [Float] This is the number of calls that have been scheduled.
    attr_reader :calls_counter_scheduled
  # @return [Float] This is the number of calls that have been queued.
    attr_reader :calls_counter_queued
  # @return [Float] This is the number of calls that have been in progress.
    attr_reader :calls_counter_in_progress
  # @return [Float] This is the number of calls whose ended reason is 'voicemail'.
    attr_reader :calls_counter_ended_voicemail
  # @return [Float] This is the number of calls that have ended.
    attr_reader :calls_counter_ended
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param status [Vapi::CampaignStatus] This is the status of the campaign.
    # @param ended_reason [Vapi::CampaignEndedReason] This is the explanation for how the campaign ended.
    # @param name [String] This is the name of the campaign. This is just for your own reference.
    # @param assistant_id [String] This is the assistant ID that will be used for the campaign calls. Note: Either
#  assistantId or workflowId can be used, but not both.
    # @param workflow_id [String] This is the workflow ID that will be used for the campaign calls. Note: Either
#  assistantId or workflowId can be used, but not both.
    # @param phone_number_id [String] This is the phone number ID that will be used for the campaign calls.
    # @param schedule_plan [Vapi::SchedulePlan] This is the schedule plan for the campaign.
    # @param customers [Array<Vapi::CreateCustomerDto>] These are the customers that will be called in the campaign.
    # @param id [String] This is the unique identifier for the campaign.
    # @param org_id [String] This is the unique identifier for the org that this campaign belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the campaign was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the campaign was last updated.
    # @param calls [Hash{String => Object}] This is a map of call IDs to campaign call details.
    # @param calls_counter_scheduled [Float] This is the number of calls that have been scheduled.
    # @param calls_counter_queued [Float] This is the number of calls that have been queued.
    # @param calls_counter_in_progress [Float] This is the number of calls that have been in progress.
    # @param calls_counter_ended_voicemail [Float] This is the number of calls whose ended reason is 'voicemail'.
    # @param calls_counter_ended [Float] This is the number of calls that have ended.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Campaign]
    def initialize(status:, ended_reason: OMIT, name:, assistant_id: OMIT, workflow_id: OMIT, phone_number_id:, schedule_plan: OMIT, customers:, id:, org_id:, created_at:, updated_at:, calls:, calls_counter_scheduled:, calls_counter_queued:, calls_counter_in_progress:, calls_counter_ended_voicemail:, calls_counter_ended:, additional_properties: nil)
      @status = status
      @ended_reason = ended_reason if ended_reason != OMIT
      @name = name
      @assistant_id = assistant_id if assistant_id != OMIT
      @workflow_id = workflow_id if workflow_id != OMIT
      @phone_number_id = phone_number_id
      @schedule_plan = schedule_plan if schedule_plan != OMIT
      @customers = customers
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @calls = calls
      @calls_counter_scheduled = calls_counter_scheduled
      @calls_counter_queued = calls_counter_queued
      @calls_counter_in_progress = calls_counter_in_progress
      @calls_counter_ended_voicemail = calls_counter_ended_voicemail
      @calls_counter_ended = calls_counter_ended
      @additional_properties = additional_properties
      @_field_set = { "status": status, "endedReason": ended_reason, "name": name, "assistantId": assistant_id, "workflowId": workflow_id, "phoneNumberId": phone_number_id, "schedulePlan": schedule_plan, "customers": customers, "id": id, "orgId": org_id, "createdAt": created_at, "updatedAt": updated_at, "calls": calls, "callsCounterScheduled": calls_counter_scheduled, "callsCounterQueued": calls_counter_queued, "callsCounterInProgress": calls_counter_in_progress, "callsCounterEndedVoicemail": calls_counter_ended_voicemail, "callsCounterEnded": calls_counter_ended }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Campaign
    #
    # @param json_object [String] 
    # @return [Vapi::Campaign]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status = parsed_json["status"]
      ended_reason = parsed_json["endedReason"]
      name = parsed_json["name"]
      assistant_id = parsed_json["assistantId"]
      workflow_id = parsed_json["workflowId"]
      phone_number_id = parsed_json["phoneNumberId"]
      unless parsed_json["schedulePlan"].nil?
        schedule_plan = parsed_json["schedulePlan"].to_json
        schedule_plan = Vapi::SchedulePlan.from_json(json_object: schedule_plan)
      else
        schedule_plan = nil
      end
      customers = parsed_json["customers"]&.map do | item |
  item = item.to_json
  Vapi::CreateCustomerDto.from_json(json_object: item)
end
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
      calls = parsed_json["calls"]
      calls_counter_scheduled = parsed_json["callsCounterScheduled"]
      calls_counter_queued = parsed_json["callsCounterQueued"]
      calls_counter_in_progress = parsed_json["callsCounterInProgress"]
      calls_counter_ended_voicemail = parsed_json["callsCounterEndedVoicemail"]
      calls_counter_ended = parsed_json["callsCounterEnded"]
      new(
        status: status,
        ended_reason: ended_reason,
        name: name,
        assistant_id: assistant_id,
        workflow_id: workflow_id,
        phone_number_id: phone_number_id,
        schedule_plan: schedule_plan,
        customers: customers,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        calls: calls,
        calls_counter_scheduled: calls_counter_scheduled,
        calls_counter_queued: calls_counter_queued,
        calls_counter_in_progress: calls_counter_in_progress,
        calls_counter_ended_voicemail: calls_counter_ended_voicemail,
        calls_counter_ended: calls_counter_ended,
        additional_properties: struct
      )
    end
# Serialize an instance of Campaign to a JSON object
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
      obj.status.is_a?(Vapi::CampaignStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.ended_reason&.is_a?(Vapi::CampaignEndedReason) != false || raise("Passed value for field obj.ended_reason is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.workflow_id&.is_a?(String) != false || raise("Passed value for field obj.workflow_id is not the expected type, validation failed.")
      obj.phone_number_id.is_a?(String) != false || raise("Passed value for field obj.phone_number_id is not the expected type, validation failed.")
      obj.schedule_plan.nil? || Vapi::SchedulePlan.validate_raw(obj: obj.schedule_plan)
      obj.customers.is_a?(Array) != false || raise("Passed value for field obj.customers is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.calls.is_a?(Hash) != false || raise("Passed value for field obj.calls is not the expected type, validation failed.")
      obj.calls_counter_scheduled.is_a?(Float) != false || raise("Passed value for field obj.calls_counter_scheduled is not the expected type, validation failed.")
      obj.calls_counter_queued.is_a?(Float) != false || raise("Passed value for field obj.calls_counter_queued is not the expected type, validation failed.")
      obj.calls_counter_in_progress.is_a?(Float) != false || raise("Passed value for field obj.calls_counter_in_progress is not the expected type, validation failed.")
      obj.calls_counter_ended_voicemail.is_a?(Float) != false || raise("Passed value for field obj.calls_counter_ended_voicemail is not the expected type, validation failed.")
      obj.calls_counter_ended.is_a?(Float) != false || raise("Passed value for field obj.calls_counter_ended is not the expected type, validation failed.")
    end
  end
end