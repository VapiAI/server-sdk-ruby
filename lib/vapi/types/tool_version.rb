# frozen_string_literal: true

module Vapi
  module Types
    class ToolVersion < Internal::Types::Model
      field :version_name, -> { String }, optional: true, nullable: false, api_name: "versionName"
      field :version_description, -> { String }, optional: true, nullable: false, api_name: "versionDescription"
      field :type, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :function, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :messages, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
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
      field :knowledge_bases, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false, api_name: "knowledgeBases"
      field :url, -> { String }, optional: true, nullable: false
      field :method_, -> { String }, optional: true, nullable: false, api_name: "method"
      field :headers, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :body, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :backoff_plan, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "backoffPlan"
      field :timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "timeoutSeconds"
      field :description, -> { String }, optional: true, nullable: false
      field :variable_extraction_plan, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "variableExtractionPlan"
      field :rejection_plan, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :credential_id, -> { String }, optional: true, nullable: false, api_name: "credentialId"
      field :extended_delay_when_preceded_by_text_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "extendedDelayWhenPrecededByTextEnabled"
      field :beep_detection_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "beepDetectionEnabled"
      field :code, -> { String }, optional: true, nullable: false
      field :environment_variables, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false, api_name: "environmentVariables"
      field :parameters, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
      field :encrypted_paths, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "encryptedPaths"
      field :sip_info_dtmf_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "sipInfoDtmfEnabled"
      field :verb, -> { String }, optional: true, nullable: false
      field :default_result, -> { String }, optional: true, nullable: false, api_name: "defaultResult"
      field :tool_messages, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false, api_name: "toolMessages"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :tool_id, -> { String }, optional: false, nullable: false, api_name: "toolId"
      field :version, -> { String }, optional: false, nullable: false
      field :config_hash, -> { String }, optional: false, nullable: false, api_name: "configHash"
      field :parent_version, -> { String }, optional: true, nullable: false, api_name: "parentVersion"
      field :created_by, -> { String }, optional: true, nullable: false, api_name: "createdBy"
      field :deleted_at, -> { String }, optional: true, nullable: false, api_name: "deletedAt"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
