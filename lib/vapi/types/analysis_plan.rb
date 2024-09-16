# frozen_string_literal: true

require_relative "summary_plan"
require_relative "structured_data_plan"
require_relative "success_evaluation_plan"
require "ostruct"
require "json"

module Vapi
  class AnalysisPlan
    # @return [Vapi::SummaryPlan] This is the plan for generating the summary of the call. This outputs to
    #  `call.analysis.summary`.
    attr_reader :summary_plan
    # @return [Vapi::StructuredDataPlan] This is the plan for generating the structured data from the call. This outputs
    #  to `call.analysis.structuredData`.
    attr_reader :structured_data_plan
    # @return [Vapi::SuccessEvaluationPlan] This is the plan for generating the success evaluation of the call. This outputs
    #  to `call.analysis.successEvaluation`.
    attr_reader :success_evaluation_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param summary_plan [Vapi::SummaryPlan] This is the plan for generating the summary of the call. This outputs to
    #  `call.analysis.summary`.
    # @param structured_data_plan [Vapi::StructuredDataPlan] This is the plan for generating the structured data from the call. This outputs
    #  to `call.analysis.structuredData`.
    # @param success_evaluation_plan [Vapi::SuccessEvaluationPlan] This is the plan for generating the success evaluation of the call. This outputs
    #  to `call.analysis.successEvaluation`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AnalysisPlan]
    def initialize(summary_plan: OMIT, structured_data_plan: OMIT, success_evaluation_plan: OMIT,
                   additional_properties: nil)
      @summary_plan = summary_plan if summary_plan != OMIT
      @structured_data_plan = structured_data_plan if structured_data_plan != OMIT
      @success_evaluation_plan = success_evaluation_plan if success_evaluation_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "summaryPlan": summary_plan,
        "structuredDataPlan": structured_data_plan,
        "successEvaluationPlan": success_evaluation_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AnalysisPlan
    #
    # @param json_object [String]
    # @return [Vapi::AnalysisPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["summaryPlan"].nil?
        summary_plan = nil
      else
        summary_plan = parsed_json["summaryPlan"].to_json
        summary_plan = Vapi::SummaryPlan.from_json(json_object: summary_plan)
      end
      if parsed_json["structuredDataPlan"].nil?
        structured_data_plan = nil
      else
        structured_data_plan = parsed_json["structuredDataPlan"].to_json
        structured_data_plan = Vapi::StructuredDataPlan.from_json(json_object: structured_data_plan)
      end
      if parsed_json["successEvaluationPlan"].nil?
        success_evaluation_plan = nil
      else
        success_evaluation_plan = parsed_json["successEvaluationPlan"].to_json
        success_evaluation_plan = Vapi::SuccessEvaluationPlan.from_json(json_object: success_evaluation_plan)
      end
      new(
        summary_plan: summary_plan,
        structured_data_plan: structured_data_plan,
        success_evaluation_plan: success_evaluation_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of AnalysisPlan to a JSON object
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
      obj.summary_plan.nil? || Vapi::SummaryPlan.validate_raw(obj: obj.summary_plan)
      obj.structured_data_plan.nil? || Vapi::StructuredDataPlan.validate_raw(obj: obj.structured_data_plan)
      obj.success_evaluation_plan.nil? || Vapi::SuccessEvaluationPlan.validate_raw(obj: obj.success_evaluation_plan)
    end
  end
end
