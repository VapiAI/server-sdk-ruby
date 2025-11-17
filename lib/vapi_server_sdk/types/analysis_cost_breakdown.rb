# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class AnalysisCostBreakdown
    # @return [Float] This is the cost to summarize the call.
    attr_reader :summary
    # @return [Float] This is the number of prompt tokens used to summarize the call.
    attr_reader :summary_prompt_tokens
    # @return [Float] This is the number of completion tokens used to summarize the call.
    attr_reader :summary_completion_tokens
    # @return [Float] This is the cost to extract structured data from the call.
    attr_reader :structured_data
    # @return [Float] This is the number of prompt tokens used to extract structured data from the
    #  call.
    attr_reader :structured_data_prompt_tokens
    # @return [Float] This is the number of completion tokens used to extract structured data from the
    #  call.
    attr_reader :structured_data_completion_tokens
    # @return [Float] This is the cost to evaluate if the call was successful.
    attr_reader :success_evaluation
    # @return [Float] This is the number of prompt tokens used to evaluate if the call was successful.
    attr_reader :success_evaluation_prompt_tokens
    # @return [Float] This is the number of completion tokens used to evaluate if the call was
    #  successful.
    attr_reader :success_evaluation_completion_tokens
    # @return [Float] This is the cost to evaluate structuredOutputs from the call.
    attr_reader :structured_output
    # @return [Float] This is the number of prompt tokens used to evaluate structuredOutputs from the
    #  call.
    attr_reader :structured_output_prompt_tokens
    # @return [Float] This is the number of completion tokens used to evaluate structuredOutputs from
    #  the call.
    attr_reader :structured_output_completion_tokens
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param summary [Float] This is the cost to summarize the call.
    # @param summary_prompt_tokens [Float] This is the number of prompt tokens used to summarize the call.
    # @param summary_completion_tokens [Float] This is the number of completion tokens used to summarize the call.
    # @param structured_data [Float] This is the cost to extract structured data from the call.
    # @param structured_data_prompt_tokens [Float] This is the number of prompt tokens used to extract structured data from the
    #  call.
    # @param structured_data_completion_tokens [Float] This is the number of completion tokens used to extract structured data from the
    #  call.
    # @param success_evaluation [Float] This is the cost to evaluate if the call was successful.
    # @param success_evaluation_prompt_tokens [Float] This is the number of prompt tokens used to evaluate if the call was successful.
    # @param success_evaluation_completion_tokens [Float] This is the number of completion tokens used to evaluate if the call was
    #  successful.
    # @param structured_output [Float] This is the cost to evaluate structuredOutputs from the call.
    # @param structured_output_prompt_tokens [Float] This is the number of prompt tokens used to evaluate structuredOutputs from the
    #  call.
    # @param structured_output_completion_tokens [Float] This is the number of completion tokens used to evaluate structuredOutputs from
    #  the call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AnalysisCostBreakdown]
    def initialize(summary: OMIT, summary_prompt_tokens: OMIT, summary_completion_tokens: OMIT, structured_data: OMIT,
                   structured_data_prompt_tokens: OMIT, structured_data_completion_tokens: OMIT, success_evaluation: OMIT, success_evaluation_prompt_tokens: OMIT, success_evaluation_completion_tokens: OMIT, structured_output: OMIT, structured_output_prompt_tokens: OMIT, structured_output_completion_tokens: OMIT, additional_properties: nil)
      @summary = summary if summary != OMIT
      @summary_prompt_tokens = summary_prompt_tokens if summary_prompt_tokens != OMIT
      @summary_completion_tokens = summary_completion_tokens if summary_completion_tokens != OMIT
      @structured_data = structured_data if structured_data != OMIT
      @structured_data_prompt_tokens = structured_data_prompt_tokens if structured_data_prompt_tokens != OMIT
      if structured_data_completion_tokens != OMIT
        @structured_data_completion_tokens = structured_data_completion_tokens
      end
      @success_evaluation = success_evaluation if success_evaluation != OMIT
      @success_evaluation_prompt_tokens = success_evaluation_prompt_tokens if success_evaluation_prompt_tokens != OMIT
      if success_evaluation_completion_tokens != OMIT
        @success_evaluation_completion_tokens = success_evaluation_completion_tokens
      end
      @structured_output = structured_output if structured_output != OMIT
      @structured_output_prompt_tokens = structured_output_prompt_tokens if structured_output_prompt_tokens != OMIT
      if structured_output_completion_tokens != OMIT
        @structured_output_completion_tokens = structured_output_completion_tokens
      end
      @additional_properties = additional_properties
      @_field_set = {
        "summary": summary,
        "summaryPromptTokens": summary_prompt_tokens,
        "summaryCompletionTokens": summary_completion_tokens,
        "structuredData": structured_data,
        "structuredDataPromptTokens": structured_data_prompt_tokens,
        "structuredDataCompletionTokens": structured_data_completion_tokens,
        "successEvaluation": success_evaluation,
        "successEvaluationPromptTokens": success_evaluation_prompt_tokens,
        "successEvaluationCompletionTokens": success_evaluation_completion_tokens,
        "structuredOutput": structured_output,
        "structuredOutputPromptTokens": structured_output_prompt_tokens,
        "structuredOutputCompletionTokens": structured_output_completion_tokens
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AnalysisCostBreakdown
    #
    # @param json_object [String]
    # @return [Vapi::AnalysisCostBreakdown]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      summary = parsed_json["summary"]
      summary_prompt_tokens = parsed_json["summaryPromptTokens"]
      summary_completion_tokens = parsed_json["summaryCompletionTokens"]
      structured_data = parsed_json["structuredData"]
      structured_data_prompt_tokens = parsed_json["structuredDataPromptTokens"]
      structured_data_completion_tokens = parsed_json["structuredDataCompletionTokens"]
      success_evaluation = parsed_json["successEvaluation"]
      success_evaluation_prompt_tokens = parsed_json["successEvaluationPromptTokens"]
      success_evaluation_completion_tokens = parsed_json["successEvaluationCompletionTokens"]
      structured_output = parsed_json["structuredOutput"]
      structured_output_prompt_tokens = parsed_json["structuredOutputPromptTokens"]
      structured_output_completion_tokens = parsed_json["structuredOutputCompletionTokens"]
      new(
        summary: summary,
        summary_prompt_tokens: summary_prompt_tokens,
        summary_completion_tokens: summary_completion_tokens,
        structured_data: structured_data,
        structured_data_prompt_tokens: structured_data_prompt_tokens,
        structured_data_completion_tokens: structured_data_completion_tokens,
        success_evaluation: success_evaluation,
        success_evaluation_prompt_tokens: success_evaluation_prompt_tokens,
        success_evaluation_completion_tokens: success_evaluation_completion_tokens,
        structured_output: structured_output,
        structured_output_prompt_tokens: structured_output_prompt_tokens,
        structured_output_completion_tokens: structured_output_completion_tokens,
        additional_properties: struct
      )
    end

    # Serialize an instance of AnalysisCostBreakdown to a JSON object
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
      obj.summary&.is_a?(Float) != false || raise("Passed value for field obj.summary is not the expected type, validation failed.")
      obj.summary_prompt_tokens&.is_a?(Float) != false || raise("Passed value for field obj.summary_prompt_tokens is not the expected type, validation failed.")
      obj.summary_completion_tokens&.is_a?(Float) != false || raise("Passed value for field obj.summary_completion_tokens is not the expected type, validation failed.")
      obj.structured_data&.is_a?(Float) != false || raise("Passed value for field obj.structured_data is not the expected type, validation failed.")
      obj.structured_data_prompt_tokens&.is_a?(Float) != false || raise("Passed value for field obj.structured_data_prompt_tokens is not the expected type, validation failed.")
      obj.structured_data_completion_tokens&.is_a?(Float) != false || raise("Passed value for field obj.structured_data_completion_tokens is not the expected type, validation failed.")
      obj.success_evaluation&.is_a?(Float) != false || raise("Passed value for field obj.success_evaluation is not the expected type, validation failed.")
      obj.success_evaluation_prompt_tokens&.is_a?(Float) != false || raise("Passed value for field obj.success_evaluation_prompt_tokens is not the expected type, validation failed.")
      obj.success_evaluation_completion_tokens&.is_a?(Float) != false || raise("Passed value for field obj.success_evaluation_completion_tokens is not the expected type, validation failed.")
      obj.structured_output&.is_a?(Float) != false || raise("Passed value for field obj.structured_output is not the expected type, validation failed.")
      obj.structured_output_prompt_tokens&.is_a?(Float) != false || raise("Passed value for field obj.structured_output_prompt_tokens is not the expected type, validation failed.")
      obj.structured_output_completion_tokens&.is_a?(Float) != false || raise("Passed value for field obj.structured_output_completion_tokens is not the expected type, validation failed.")
    end
  end
end
