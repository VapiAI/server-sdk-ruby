# frozen_string_literal: true

module Vapi
  module Types
    class UpdateWorkflowDto < Internal::Types::Model
      field :nodes, -> { Internal::Types::Array[Vapi::Types::UpdateWorkflowDtoNodesItem] }, optional: true, nullable: false
      field :model, -> { Vapi::Types::UpdateWorkflowDtoModel }, optional: true, nullable: false
      field :transcriber, -> { Vapi::Types::UpdateWorkflowDtoTranscriber }, optional: true, nullable: false
      field :voice, -> { Vapi::Types::UpdateWorkflowDtoVoice }, optional: true, nullable: false
      field :observability_plan, -> { Vapi::Types::LangfuseObservabilityPlan }, optional: true, nullable: false, api_name: "observabilityPlan"
      field :background_sound, -> { Vapi::Types::UpdateWorkflowDtoBackgroundSound }, optional: true, nullable: false, api_name: "backgroundSound"
      field :hooks, -> { Internal::Types::Array[Vapi::Types::UpdateWorkflowDtoHooksItem] }, optional: true, nullable: false
      field :credentials, -> { Internal::Types::Array[Vapi::Types::UpdateWorkflowDtoCredentialsItem] }, optional: true, nullable: false
      field :voicemail_detection, -> { Vapi::Types::UpdateWorkflowDtoVoicemailDetection }, optional: true, nullable: false, api_name: "voicemailDetection"
      field :max_duration_seconds, -> { Integer }, optional: true, nullable: false, api_name: "maxDurationSeconds"
      field :name, -> { String }, optional: true, nullable: false
      field :edges, -> { Internal::Types::Array[Vapi::Types::Edge] }, optional: true, nullable: false
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
