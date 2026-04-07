# frozen_string_literal: true

module Vapi
  module Types
    class ArtifactPlan < Internal::Types::Model
      field :recording_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "recordingEnabled"
      field :recording_format, -> { Vapi::Types::ArtifactPlanRecordingFormat }, optional: true, nullable: false, api_name: "recordingFormat"
      field :recording_use_custom_storage_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "recordingUseCustomStorageEnabled"
      field :video_recording_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "videoRecordingEnabled"
      field :full_message_history_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "fullMessageHistoryEnabled"
      field :pcap_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "pcapEnabled"
      field :pcap_s_3_path_prefix, -> { String }, optional: true, nullable: false, api_name: "pcapS3PathPrefix"
      field :pcap_use_custom_storage_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "pcapUseCustomStorageEnabled"
      field :logging_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "loggingEnabled"
      field :logging_use_custom_storage_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "loggingUseCustomStorageEnabled"
      field :transcript_plan, -> { Vapi::Types::TranscriptPlan }, optional: true, nullable: false, api_name: "transcriptPlan"
      field :recording_path, -> { String }, optional: true, nullable: false, api_name: "recordingPath"
      field :structured_output_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "structuredOutputIds"
      field :structured_outputs, -> { Internal::Types::Array[Vapi::Types::CreateStructuredOutputDto] }, optional: true, nullable: false, api_name: "structuredOutputs"
      field :scorecard_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "scorecardIds"
      field :scorecards, -> { Internal::Types::Array[Vapi::Types::CreateScorecardDto] }, optional: true, nullable: false
      field :logging_path, -> { String }, optional: true, nullable: false, api_name: "loggingPath"
    end
  end
end
