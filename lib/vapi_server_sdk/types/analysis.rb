# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class Analysis
    # @return [String] This is the summary of the call. Customize by setting
    #  `assistant.analysisPlan.summaryPrompt`.
    attr_reader :summary
    # @return [Hash{String => Object}] This is the structured data extracted from the call. Customize by setting
    #  `assistant.analysisPlan.structuredDataPrompt` and/or
    #  `assistant.analysisPlan.structuredDataSchema`.
    attr_reader :structured_data
    # @return [Array<Hash{String => Object}>] This is the structured data catalog of the call. Customize by setting
    #  `assistant.analysisPlan.structuredDataMultiPlan`.
    attr_reader :structured_data_multi
    # @return [String] This is the evaluation of the call. Customize by setting
    #  `assistant.analysisPlan.successEvaluationPrompt` and/or
    #  `assistant.analysisPlan.successEvaluationRubric`.
    attr_reader :success_evaluation
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param summary [String] This is the summary of the call. Customize by setting
    #  `assistant.analysisPlan.summaryPrompt`.
    # @param structured_data [Hash{String => Object}] This is the structured data extracted from the call. Customize by setting
    #  `assistant.analysisPlan.structuredDataPrompt` and/or
    #  `assistant.analysisPlan.structuredDataSchema`.
    # @param structured_data_multi [Array<Hash{String => Object}>] This is the structured data catalog of the call. Customize by setting
    #  `assistant.analysisPlan.structuredDataMultiPlan`.
    # @param success_evaluation [String] This is the evaluation of the call. Customize by setting
    #  `assistant.analysisPlan.successEvaluationPrompt` and/or
    #  `assistant.analysisPlan.successEvaluationRubric`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Analysis]
    def initialize(summary: OMIT, structured_data: OMIT, structured_data_multi: OMIT, success_evaluation: OMIT,
                   additional_properties: nil)
      @summary = summary if summary != OMIT
      @structured_data = structured_data if structured_data != OMIT
      @structured_data_multi = structured_data_multi if structured_data_multi != OMIT
      @success_evaluation = success_evaluation if success_evaluation != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "summary": summary,
        "structuredData": structured_data,
        "structuredDataMulti": structured_data_multi,
        "successEvaluation": success_evaluation
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Analysis
    #
    # @param json_object [String]
    # @return [Vapi::Analysis]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      summary = parsed_json["summary"]
      structured_data = parsed_json["structuredData"]
      structured_data_multi = parsed_json["structuredDataMulti"]
      success_evaluation = parsed_json["successEvaluation"]
      new(
        summary: summary,
        structured_data: structured_data,
        structured_data_multi: structured_data_multi,
        success_evaluation: success_evaluation,
        additional_properties: struct
      )
    end

    # Serialize an instance of Analysis to a JSON object
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
      obj.summary&.is_a?(String) != false || raise("Passed value for field obj.summary is not the expected type, validation failed.")
      obj.structured_data&.is_a?(Hash) != false || raise("Passed value for field obj.structured_data is not the expected type, validation failed.")
      obj.structured_data_multi&.is_a?(Array) != false || raise("Passed value for field obj.structured_data_multi is not the expected type, validation failed.")
      obj.success_evaluation&.is_a?(String) != false || raise("Passed value for field obj.success_evaluation is not the expected type, validation failed.")
    end
  end
end
