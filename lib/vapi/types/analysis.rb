# frozen_string_literal: true

module Vapi
  module Types
    # Post-call analysis results, including summary, structured data, and success evaluation outputs.
    class Analysis < Internal::Types::Model
      field :summary, -> { String }, optional: true, nullable: false
      field :structured_data, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "structuredData"
      field :structured_data_multi, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false, api_name: "structuredDataMulti"
      field :success_evaluation, -> { String }, optional: true, nullable: false, api_name: "successEvaluation"
    end
  end
end
