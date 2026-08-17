# frozen_string_literal: true

module Vapi
  module Types
    # Artifacts generated during a call, including messages, recordings, transcript, logs, packet capture, workflow-node
    # data, variables, performance metrics, structured outputs, scorecards, and transfers.
    class Artifact < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::ArtifactMessagesItem] }, optional: true, nullable: false
      field :messages_open_ai_formatted, -> { Internal::Types::Array[Vapi::Types::OpenAiMessage] }, optional: true, nullable: false, api_name: "messagesOpenAIFormatted"
      field :skipped_structured_outputs, -> { Internal::Types::Hash[String, Vapi::Types::SkippedStructuredOutput] }, optional: true, nullable: false, api_name: "skippedStructuredOutputs"
      field :transfers, -> { Internal::Types::Array[Vapi::Types::TransferArtifact] }, optional: true, nullable: false
      field :recording_url, -> { String }, optional: true, nullable: false, api_name: "recordingUrl"
      field :stereo_recording_url, -> { String }, optional: true, nullable: false, api_name: "stereoRecordingUrl"
      field :video_recording_url, -> { String }, optional: true, nullable: false, api_name: "videoRecordingUrl"
      field :video_recording_start_delay_seconds, -> { Integer }, optional: true, nullable: false, api_name: "videoRecordingStartDelaySeconds"
      field :recording, -> { Vapi::Types::Recording }, optional: true, nullable: false
      field :transcript, -> { String }, optional: true, nullable: false
      field :pcap_url, -> { String }, optional: true, nullable: false, api_name: "pcapUrl"
      field :log_url, -> { String }, optional: true, nullable: false, api_name: "logUrl"
      field :nodes, -> { Internal::Types::Array[Vapi::Types::NodeArtifact] }, optional: true, nullable: false
      field :assistant_activations, -> { Internal::Types::Array[Vapi::Types::AssistantActivation] }, optional: true, nullable: false, api_name: "assistantActivations"
      field :variable_values, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "variableValues"
      field :performance_metrics, -> { Vapi::Types::PerformanceMetrics }, optional: true, nullable: false, api_name: "performanceMetrics"
      field :structured_outputs, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "structuredOutputs"
      field :scorecards, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :structured_outputs_last_updated_at, -> { String }, optional: true, nullable: false, api_name: "structuredOutputsLastUpdatedAt"
      field :presigned_mono_url, -> { String }, optional: true, nullable: false, api_name: "presignedMonoUrl"
      field :presigned_stereo_url, -> { String }, optional: true, nullable: false, api_name: "presignedStereoUrl"
      field :presigned_video_url, -> { String }, optional: true, nullable: false, api_name: "presignedVideoUrl"
      field :presigned_assistant_url, -> { String }, optional: true, nullable: false, api_name: "presignedAssistantUrl"
      field :presigned_customer_url, -> { String }, optional: true, nullable: false, api_name: "presignedCustomerUrl"
      field :presigned_pcap_url, -> { String }, optional: true, nullable: false, api_name: "presignedPcapUrl"
      field :presigned_log_url, -> { String }, optional: true, nullable: false, api_name: "presignedLogUrl"
      field :presigned_urls_expires_at, -> { String }, optional: true, nullable: false, api_name: "presignedUrlsExpiresAt"
    end
  end
end
