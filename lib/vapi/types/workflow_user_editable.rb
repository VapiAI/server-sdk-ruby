# frozen_string_literal: true

module Vapi
  module Types
    class WorkflowUserEditable < Internal::Types::Model
      field :nodes, -> { Internal::Types::Array[Vapi::Types::WorkflowUserEditableNodesItem] }, optional: false, nullable: false
      field :model, -> { Vapi::Types::WorkflowUserEditableModel }, optional: true, nullable: false
      field :transcriber, -> { Vapi::Types::WorkflowUserEditableTranscriber }, optional: true, nullable: false
      field :voice, -> { Vapi::Types::WorkflowUserEditableVoice }, optional: true, nullable: false
      field :observability_plan, -> { Vapi::Types::LangfuseObservabilityPlan }, optional: true, nullable: false, api_name: "observabilityPlan"
      field :background_sound, -> { Vapi::Types::WorkflowUserEditableBackgroundSound }, optional: true, nullable: false, api_name: "backgroundSound"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::WorkflowUserEditableHooksItem] }, optional: true, nullable: false
      field :credentials, -> { Internal::Types::Array[Vapi::Types::WorkflowUserEditableCredentialsItem] }, optional: true, nullable: false
      field :voicemail_detection, -> { Vapi::Types::WorkflowUserEditableVoicemailDetection }, optional: true, nullable: false, api_name: "voicemailDetection"
      field :max_duration_seconds, -> { Integer }, optional: true, nullable: false, api_name: "maxDurationSeconds"
      field :name, -> { String }, optional: false, nullable: false
      field :edges, -> { Internal::Types::Array[Vapi::Types::Edge] }, optional: false, nullable: false
      field :global_prompt, -> { String }, optional: true, nullable: false, api_name: "globalPrompt"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :compliance_plan, -> { Vapi::Types::CompliancePlan }, optional: true, nullable: false, api_name: "compliancePlan"
      field :analysis_plan, -> { Vapi::Types::AnalysisPlan }, optional: true, nullable: false, api_name: "analysisPlan"
      field :artifact_plan, -> { Vapi::Types::ArtifactPlan }, optional: true, nullable: false, api_name: "artifactPlan"
      field :start_speaking_plan, -> { Vapi::Types::StartSpeakingPlan }, optional: true, nullable: false, api_name: "startSpeakingPlan"
      field :stop_speaking_plan, -> { Vapi::Types::StopSpeakingPlan }, optional: true, nullable: false, api_name: "stopSpeakingPlan"
      field :monitor_plan, -> { Vapi::Types::MonitorPlan }, optional: true, nullable: false, api_name: "monitorPlan"
      field :background_speech_denoising_plan, -> { Vapi::Types::BackgroundSpeechDenoisingPlan }, optional: true, nullable: false, api_name: "backgroundSpeechDenoisingPlan"
      field :credential_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "credentialIds"
      field :keypad_input_plan, -> { Vapi::Types::KeypadInputPlan }, optional: true, nullable: false, api_name: "keypadInputPlan"
      field :voicemail_message, -> { String }, optional: true, nullable: false, api_name: "voicemailMessage"
    end
  end
end
