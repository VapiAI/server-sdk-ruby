# frozen_string_literal: true

require_relative "eval_run_status"
require_relative "eval_run_ended_reason"
require_relative "create_eval_dto"
require_relative "eval_run_target"
require "date"
require_relative "eval_run_result"
require_relative "eval_run_type"
require "ostruct"
require "json"

module Vapi
  class EvalRun
    # @return [Vapi::EvalRunStatus] This is the status of the eval run. When an eval run is created, the status is
    #  'running'.
    #  When the eval run is completed, the status is 'ended'.
    attr_reader :status
    # @return [Vapi::EvalRunEndedReason] This is the reason for the eval run to end.
    #  When the eval run is completed normally i.e end of mock conversation, the status
    #  is 'mockConversation.done'.
    #  When the eval fails due to an error like Chat error or incorrect configuration,
    #  the status is 'error'.
    #  When the eval runs for too long, due to model issues or tool call issues, the
    #  status is 'timeout'.
    #  When the eval run is cancelled by the user, the status is 'cancelled'.
    #  When the eval run is cancelled by Vapi for any reason, the status is 'aborted'.
    attr_reader :ended_reason
    # @return [Vapi::CreateEvalDto] This is the transient eval that will be run
    attr_reader :eval
    # @return [Vapi::EvalRunTarget] This is the target that will be run against the eval
    attr_reader :target
    # @return [String]
    attr_reader :id
    # @return [String]
    attr_reader :org_id
    # @return [DateTime]
    attr_reader :created_at
    # @return [DateTime]
    attr_reader :started_at
    # @return [DateTime]
    attr_reader :ended_at
    # @return [String] This is the ended message when the eval run ended for any reason apart from
    #  mockConversation.done
    attr_reader :ended_message
    # @return [Array<Vapi::EvalRunResult>] This is the results of the eval or suite run.
    #  The array will have a single item for an eval run, and multiple items each
    #  corresponding to the an eval in a suite run in the same order as the evals in
    #  the suite.
    attr_reader :results
    # @return [Float] This is the cost of the eval or suite run in USD.
    attr_reader :cost
    # @return [Array<Hash{String => Object}>] This is the break up of costs of the eval or suite run.
    attr_reader :costs
    # @return [Vapi::EvalRunType] This is the type of the run.
    #  Currently it is fixed to `eval`.
    attr_reader :type
    # @return [String] This is the id of the eval that will be run.
    attr_reader :eval_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param status [Vapi::EvalRunStatus] This is the status of the eval run. When an eval run is created, the status is
    #  'running'.
    #  When the eval run is completed, the status is 'ended'.
    # @param ended_reason [Vapi::EvalRunEndedReason] This is the reason for the eval run to end.
    #  When the eval run is completed normally i.e end of mock conversation, the status
    #  is 'mockConversation.done'.
    #  When the eval fails due to an error like Chat error or incorrect configuration,
    #  the status is 'error'.
    #  When the eval runs for too long, due to model issues or tool call issues, the
    #  status is 'timeout'.
    #  When the eval run is cancelled by the user, the status is 'cancelled'.
    #  When the eval run is cancelled by Vapi for any reason, the status is 'aborted'.
    # @param eval [Vapi::CreateEvalDto] This is the transient eval that will be run
    # @param target [Vapi::EvalRunTarget] This is the target that will be run against the eval
    # @param id [String]
    # @param org_id [String]
    # @param created_at [DateTime]
    # @param started_at [DateTime]
    # @param ended_at [DateTime]
    # @param ended_message [String] This is the ended message when the eval run ended for any reason apart from
    #  mockConversation.done
    # @param results [Array<Vapi::EvalRunResult>] This is the results of the eval or suite run.
    #  The array will have a single item for an eval run, and multiple items each
    #  corresponding to the an eval in a suite run in the same order as the evals in
    #  the suite.
    # @param cost [Float] This is the cost of the eval or suite run in USD.
    # @param costs [Array<Hash{String => Object}>] This is the break up of costs of the eval or suite run.
    # @param type [Vapi::EvalRunType] This is the type of the run.
    #  Currently it is fixed to `eval`.
    # @param eval_id [String] This is the id of the eval that will be run.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::EvalRun]
    def initialize(status:, ended_reason:, target:, id:, org_id:, created_at:, started_at:, ended_at:, results:, cost:, costs:, type:, eval: OMIT,
                   ended_message: OMIT, eval_id: OMIT, additional_properties: nil)
      @status = status
      @ended_reason = ended_reason
      @eval = eval if eval != OMIT
      @target = target
      @id = id
      @org_id = org_id
      @created_at = created_at
      @started_at = started_at
      @ended_at = ended_at
      @ended_message = ended_message if ended_message != OMIT
      @results = results
      @cost = cost
      @costs = costs
      @type = type
      @eval_id = eval_id if eval_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "status": status,
        "endedReason": ended_reason,
        "eval": eval,
        "target": target,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "startedAt": started_at,
        "endedAt": ended_at,
        "endedMessage": ended_message,
        "results": results,
        "cost": cost,
        "costs": costs,
        "type": type,
        "evalId": eval_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of EvalRun
    #
    # @param json_object [String]
    # @return [Vapi::EvalRun]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status = parsed_json["status"]
      ended_reason = parsed_json["endedReason"]
      if parsed_json["eval"].nil?
        eval = nil
      else
        eval = parsed_json["eval"].to_json
        eval = Vapi::CreateEvalDto.from_json(json_object: eval)
      end
      if parsed_json["target"].nil?
        target = nil
      else
        target = parsed_json["target"].to_json
        target = Vapi::EvalRunTarget.from_json(json_object: target)
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      started_at = (DateTime.parse(parsed_json["startedAt"]) unless parsed_json["startedAt"].nil?)
      ended_at = (DateTime.parse(parsed_json["endedAt"]) unless parsed_json["endedAt"].nil?)
      ended_message = parsed_json["endedMessage"]
      results = parsed_json["results"]&.map do |item|
        item = item.to_json
        Vapi::EvalRunResult.from_json(json_object: item)
      end
      cost = parsed_json["cost"]
      costs = parsed_json["costs"]
      type = parsed_json["type"]
      eval_id = parsed_json["evalId"]
      new(
        status: status,
        ended_reason: ended_reason,
        eval: eval,
        target: target,
        id: id,
        org_id: org_id,
        created_at: created_at,
        started_at: started_at,
        ended_at: ended_at,
        ended_message: ended_message,
        results: results,
        cost: cost,
        costs: costs,
        type: type,
        eval_id: eval_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of EvalRun to a JSON object
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
      obj.status.is_a?(Vapi::EvalRunStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.ended_reason.is_a?(Vapi::EvalRunEndedReason) != false || raise("Passed value for field obj.ended_reason is not the expected type, validation failed.")
      obj.eval.nil? || Vapi::CreateEvalDto.validate_raw(obj: obj.eval)
      Vapi::EvalRunTarget.validate_raw(obj: obj.target)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.started_at.is_a?(DateTime) != false || raise("Passed value for field obj.started_at is not the expected type, validation failed.")
      obj.ended_at.is_a?(DateTime) != false || raise("Passed value for field obj.ended_at is not the expected type, validation failed.")
      obj.ended_message&.is_a?(String) != false || raise("Passed value for field obj.ended_message is not the expected type, validation failed.")
      obj.results.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      obj.cost.is_a?(Float) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
      obj.costs.is_a?(Array) != false || raise("Passed value for field obj.costs is not the expected type, validation failed.")
      obj.type.is_a?(Vapi::EvalRunType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.eval_id&.is_a?(String) != false || raise("Passed value for field obj.eval_id is not the expected type, validation failed.")
    end
  end
end
