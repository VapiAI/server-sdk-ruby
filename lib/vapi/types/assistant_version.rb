# frozen_string_literal: true

module Vapi
  module Types
    class AssistantVersion < Internal::Types::Model
      field :transcriber, -> { Vapi::Types::AssistantVersionTranscriber }, optional: true, nullable: false
      field :model, -> { Vapi::Types::AssistantVersionModel }, optional: true, nullable: false
      field :voice, -> { Vapi::Types::AssistantVersionVoice }, optional: true, nullable: false
      field :first_message, -> { String }, optional: true, nullable: false, api_name: "firstMessage"
      field :first_message_interruptions_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "firstMessageInterruptionsEnabled"
      field :first_message_mode, -> { Vapi::Types::AssistantVersionFirstMessageMode }, optional: true, nullable: false, api_name: "firstMessageMode"
      field :voicemail_detection, -> { Vapi::Types::AssistantVersionVoicemailDetection }, optional: true, nullable: false, api_name: "voicemailDetection"
      field :client_messages, -> { Internal::Types::Array[Vapi::Types::AssistantVersionClientMessagesItem] }, optional: true, nullable: false, api_name: "clientMessages"
      field :server_messages, -> { Internal::Types::Array[Vapi::Types::AssistantVersionServerMessagesItem] }, optional: true, nullable: false, api_name: "serverMessages"
      field :max_duration_seconds, -> { Integer }, optional: true, nullable: false, api_name: "maxDurationSeconds"
      field :background_sound, -> { Vapi::Types::AssistantVersionBackgroundSound }, optional: true, nullable: false, api_name: "backgroundSound"
      field :model_output_in_messages_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "modelOutputInMessagesEnabled"
      field :transport_configurations, -> { Internal::Types::Array[Vapi::Types::TransportConfigurationTwilio] }, optional: true, nullable: false, api_name: "transportConfigurations"
      field :observability_plan, -> { Vapi::Types::LangfuseObservabilityPlan }, optional: true, nullable: false, api_name: "observabilityPlan"
      field :credentials, -> { Internal::Types::Array[Vapi::Types::AssistantVersionCredentialsItem] }, optional: true, nullable: false
      field :hooks, -> { Internal::Types::Array[Vapi::Types::AssistantVersionHooksItem] }, optional: true, nullable: false
      field :version_name, -> { String }, optional: true, nullable: false, api_name: "versionName"
      field :version_description, -> { String }, optional: true, nullable: false, api_name: "versionDescription"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
      field :version, -> { String }, optional: false, nullable: false
      field :config_hash, -> { String }, optional: false, nullable: false, api_name: "configHash"
      field :parent_version, -> { String }, optional: true, nullable: false, api_name: "parentVersion"
      field :restored_from_version, -> { String }, optional: true, nullable: false, api_name: "restoredFromVersion"
      field :created_by, -> { String }, optional: true, nullable: false, api_name: "createdBy"
      field :deleted_at, -> { String }, optional: true, nullable: false, api_name: "deletedAt"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :name, -> { String }, optional: true, nullable: false
      field :voicemail_message, -> { String }, optional: true, nullable: false, api_name: "voicemailMessage"
      field :end_call_message, -> { String }, optional: true, nullable: false, api_name: "endCallMessage"
      field :end_call_phrases, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "endCallPhrases"
      field :compliance_plan, -> { Vapi::Types::CompliancePlan }, optional: true, nullable: false, api_name: "compliancePlan"
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :background_speech_denoising_plan, -> { Vapi::Types::BackgroundSpeechDenoisingPlan }, optional: true, nullable: false, api_name: "backgroundSpeechDenoisingPlan"
      field :analysis_plan, -> { Vapi::Types::AnalysisPlan }, optional: true, nullable: false, api_name: "analysisPlan"
      field :artifact_plan, -> { Vapi::Types::ArtifactPlan }, optional: true, nullable: false, api_name: "artifactPlan"
      field :start_speaking_plan, -> { Vapi::Types::StartSpeakingPlan }, optional: true, nullable: false, api_name: "startSpeakingPlan"
      field :stop_speaking_plan, -> { Vapi::Types::StopSpeakingPlan }, optional: true, nullable: false, api_name: "stopSpeakingPlan"
      field :monitor_plan, -> { Vapi::Types::MonitorPlan }, optional: true, nullable: false, api_name: "monitorPlan"
      field :credential_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "credentialIds"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :keypad_input_plan, -> { Vapi::Types::KeypadInputPlan }, optional: true, nullable: false, api_name: "keypadInputPlan"
    end
  end
end
