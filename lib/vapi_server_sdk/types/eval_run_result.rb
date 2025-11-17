# frozen_string_literal: true

require_relative "eval_run_result_status"
require_relative "eval_run_result_messages_item"
require "date"
require "ostruct"
require "json"

module Vapi
  class EvalRunResult
    # @return [Vapi::EvalRunResultStatus] This is the status of the eval run result.
    #  The status is only 'pass' or 'fail' for an eval run result.
    #  Currently, An eval is considered `pass` only if all the Assistant Judge messages
    #  are evaluated to pass.
    attr_reader :status
    # @return [Array<Vapi::EvalRunResultMessagesItem>] This is the messages of the eval run result.
    #  It contains the user/system messages
    attr_reader :messages
    # @return [DateTime] This is the start time of the eval run result.
    attr_reader :started_at
    # @return [DateTime] This is the end time of the eval run result.
    attr_reader :ended_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param status [Vapi::EvalRunResultStatus] This is the status of the eval run result.
    #  The status is only 'pass' or 'fail' for an eval run result.
    #  Currently, An eval is considered `pass` only if all the Assistant Judge messages
    #  are evaluated to pass.
    # @param messages [Array<Vapi::EvalRunResultMessagesItem>] This is the messages of the eval run result.
    #  It contains the user/system messages
    # @param started_at [DateTime] This is the start time of the eval run result.
    # @param ended_at [DateTime] This is the end time of the eval run result.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::EvalRunResult]
    def initialize(status:, messages:, started_at:, ended_at:, additional_properties: nil)
      @status = status
      @messages = messages
      @started_at = started_at
      @ended_at = ended_at
      @additional_properties = additional_properties
      @_field_set = { "status": status, "messages": messages, "startedAt": started_at, "endedAt": ended_at }
    end

    # Deserialize a JSON object to an instance of EvalRunResult
    #
    # @param json_object [String]
    # @return [Vapi::EvalRunResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status = parsed_json["status"]
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::EvalRunResultMessagesItem.from_json(json_object: item)
      end
      started_at = (DateTime.parse(parsed_json["startedAt"]) unless parsed_json["startedAt"].nil?)
      ended_at = (DateTime.parse(parsed_json["endedAt"]) unless parsed_json["endedAt"].nil?)
      new(
        status: status,
        messages: messages,
        started_at: started_at,
        ended_at: ended_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of EvalRunResult to a JSON object
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
      obj.status.is_a?(Vapi::EvalRunResultStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.messages.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.started_at.is_a?(DateTime) != false || raise("Passed value for field obj.started_at is not the expected type, validation failed.")
      obj.ended_at.is_a?(DateTime) != false || raise("Passed value for field obj.ended_at is not the expected type, validation failed.")
    end
  end
end
