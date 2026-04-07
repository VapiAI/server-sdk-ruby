# frozen_string_literal: true

module Vapi
  module Types
    class Assistant < Internal::Types::Model
      field :transcriber, -> { Vapi::Types::AssistantTranscriber }, optional: true, nullable: false
      field :model, -> { Vapi::Types::AssistantModel }, optional: true, nullable: false
      field :voice, -> { Vapi::Types::AssistantVoice }, optional: true, nullable: false
      field :first_message, -> { String }, optional: true, nullable: false, api_name: "firstMessage"
      field :first_message_interruptions_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "firstMessageInterruptionsEnabled"
      field :first_message_mode, -> { Vapi::Types::AssistantFirstMessageMode }, optional: true, nullable: false, api_name: "firstMessageMode"
      field :voicemail_detection, -> { Vapi::Types::AssistantVoicemailDetection }, optional: true, nullable: false, api_name: "voicemailDetection"
      field :client_messages, -> { Internal::Types::Array[Vapi::Types::AssistantClientMessagesItem] }, optional: true, nullable: false, api_name: "clientMessages"
      field :server_messages, -> { Internal::Types::Array[Vapi::Types::AssistantServerMessagesItem] }, optional: true, nullable: false, api_name: "serverMessages"
      field :max_duration_seconds, -> { Integer }, optional: true, nullable: false, api_name: "maxDurationSeconds"
      field :background_sound, -> { Vapi::Types::AssistantBackgroundSound }, optional: true, nullable: false, api_name: "backgroundSound"
      field :model_output_in_messages_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "modelOutputInMessagesEnabled"
      field :transport_configurations, -> { Internal::Types::Array[Vapi::Types::TransportConfigurationTwilio] }, optional: true, nullable: false, api_name: "transportConfigurations"
      field :observability_plan, -> { Vapi::Types::LangfuseObservabilityPlan }, optional: true, nullable: false, api_name: "observabilityPlan"
      field :credentials, -> { Internal::Types::Array[Vapi::Types::AssistantCredentialsItem] }, optional: true, nullable: false
      field :hooks, -> { Internal::Types::Array[Vapi::Types::AssistantHooksItem] }, optional: true, nullable: false
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
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
