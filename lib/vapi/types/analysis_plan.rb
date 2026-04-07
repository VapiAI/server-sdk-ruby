# frozen_string_literal: true

module Vapi
  module Types
    class AnalysisPlan < Internal::Types::Model
      field :min_messages_threshold, -> { Integer }, optional: true, nullable: false, api_name: "minMessagesThreshold"
      field :summary_plan, -> { Vapi::Types::SummaryPlan }, optional: true, nullable: false, api_name: "summaryPlan"
      field :structured_data_plan, -> { Vapi::Types::StructuredDataPlan }, optional: true, nullable: false, api_name: "structuredDataPlan"
      field :structured_data_multi_plan, -> { Internal::Types::Array[Vapi::Types::StructuredDataMultiPlan] }, optional: true, nullable: false, api_name: "structuredDataMultiPlan"
      field :success_evaluation_plan, -> { Vapi::Types::SuccessEvaluationPlan }, optional: true, nullable: false, api_name: "successEvaluationPlan"
      field :outcome_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "outcomeIds"
    end
  end
end
