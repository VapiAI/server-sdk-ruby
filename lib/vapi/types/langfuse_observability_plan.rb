# frozen_string_literal: true

module Vapi
  module Types
    class LangfuseObservabilityPlan < Internal::Types::Model
      field :provider, -> { Vapi::Types::LangfuseObservabilityPlanProvider }, optional: false, nullable: false
      field :prompt_name, -> { String }, optional: true, nullable: false, api_name: "promptName"
      field :prompt_version, -> { Integer }, optional: true, nullable: false, api_name: "promptVersion"
      field :trace_name, -> { String }, optional: true, nullable: false, api_name: "traceName"
      field :tags, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
