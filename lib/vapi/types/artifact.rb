# frozen_string_literal: true

module Vapi
  module Types
    class Artifact < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::ArtifactMessagesItem] }, optional: true, nullable: false
      field :messages_open_ai_formatted, -> { Internal::Types::Array[Vapi::Types::OpenAiMessage] }, optional: true, nullable: false, api_name: "messagesOpenAIFormatted"
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
      field :transfers, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :structured_outputs_last_updated_at, -> { String }, optional: true, nullable: false, api_name: "structuredOutputsLastUpdatedAt"
    end
  end
end
