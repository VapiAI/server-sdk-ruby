# frozen_string_literal: true

module Vapi
  module Types
    class UpdateToolDraftDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateToolDraftDtoMessagesItem] }, optional: true, nullable: false
      field :type, -> { Vapi::Types::UpdateToolDraftDtoType }, optional: true, nullable: false
      field :function, -> { Vapi::Types::OpenAiFunction }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :template_id, -> { String }, optional: true, nullable: false, api_name: "templateId"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :async, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :destinations, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :sub_type, -> { String }, optional: true, nullable: false, api_name: "subType"
      field :display_width_px, -> { Integer }, optional: true, nullable: false, api_name: "displayWidthPx"
      field :display_height_px, -> { Integer }, optional: true, nullable: false, api_name: "displayHeightPx"
      field :display_number, -> { Integer }, optional: true, nullable: false, api_name: "displayNumber"
      field :knowledge_bases, -> { Internal::Types::Array[Vapi::Types::KnowledgeBase] }, optional: true, nullable: false, api_name: "knowledgeBases"
      field :url, -> { String }, optional: true, nullable: false
      field :method_, -> { Vapi::Types::UpdateToolDraftDtoMethod }, optional: true, nullable: false, api_name: "method"
      field :headers, -> { Vapi::Types::JsonSchema }, optional: true, nullable: false
      field :body, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :backoff_plan, -> { Vapi::Types::BackoffPlan }, optional: true, nullable: false, api_name: "backoffPlan"
      field :timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "timeoutSeconds"
      field :description, -> { String }, optional: true, nullable: false
      field :variable_extraction_plan, -> { Vapi::Types::VariableExtractionPlan }, optional: true, nullable: false, api_name: "variableExtractionPlan"
      field :credential_id, -> { String }, optional: true, nullable: false, api_name: "credentialId"
      field :extended_delay_when_preceded_by_text_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "extendedDelayWhenPrecededByTextEnabled"
      field :beep_detection_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "beepDetectionEnabled"
      field :code, -> { String }, optional: true, nullable: false
      field :environment_variables, -> { Internal::Types::Array[Vapi::Types::CodeToolEnvironmentVariable] }, optional: true, nullable: false, api_name: "environmentVariables"
      field :parameters, -> { Internal::Types::Array[Vapi::Types::ToolParameter] }, optional: true, nullable: false
      field :encrypted_paths, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "encryptedPaths"
      field :sip_info_dtmf_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "sipInfoDtmfEnabled"
      field :verb, -> { Vapi::Types::UpdateToolDraftDtoVerb }, optional: true, nullable: false
      field :default_result, -> { String }, optional: true, nullable: false, api_name: "defaultResult"
      field :tool_messages, -> { Internal::Types::Array[Vapi::Types::McpToolMessages] }, optional: true, nullable: false, api_name: "toolMessages"
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
