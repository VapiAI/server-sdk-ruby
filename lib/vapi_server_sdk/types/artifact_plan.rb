# frozen_string_literal: true

require_relative "artifact_plan_recording_format"
require_relative "transcript_plan"
require "ostruct"
require "json"

module Vapi
  class ArtifactPlan
    # @return [Boolean] This determines whether assistant's calls are recorded. Defaults to true.
    #  Usage:
    #  - If you don't want to record the calls, set this to false.
    #  - If you want to record the calls when `assistant.hipaaEnabled` (deprecated) or
    #  `assistant.compliancePlan.hipaaEnabled` explicity set this to true and make sure
    #  to provide S3 or GCP credentials on the Provider Credentials page in the
    #  Dashboard.
    #  You can find the recording at `call.artifact.recordingUrl` and
    #  `call.artifact.stereoRecordingUrl` after the call is ended.
    #  @default true
    attr_reader :recording_enabled
    # @return [Vapi::ArtifactPlanRecordingFormat] This determines the format of the recording. Defaults to `wav;l16`.
    #  @default 'wav;l16'
    attr_reader :recording_format
    # @return [Boolean] This determines whether the video is recorded during the call. Defaults to
    #  false. Only relevant for `webCall` type.
    #  You can find the video recording at `call.artifact.videoRecordingUrl` after the
    #  call is ended.
    #  @default false
    attr_reader :video_recording_enabled
    # @return [Boolean] This determines whether the SIP packet capture is enabled. Defaults to true.
    #  Only relevant for `phone` type calls where phone number's provider is `vapi` or
    #  `byo-phone-number`.
    #  You can find the packet capture at `call.artifact.pcapUrl` after the call is
    #  ended.
    #  @default true
    attr_reader :pcap_enabled
    # @return [String] This is the path where the SIP packet capture will be uploaded. This is only
    #  used if you have provided S3 or GCP credentials on the Provider Credentials page
    #  in the Dashboard.
    #  If credential.s3PathPrefix or credential.bucketPlan.path is set, this will
    #  append to it.
    #  Usage:
    #  - If you want to upload the packet capture to a specific path, set this to the
    #  path. Example: `/my-assistant-captures`.
    #  - If you want to upload the packet capture to the root of the bucket, set this
    #  to `/`.
    #  @default '/'
    attr_reader :pcap_s_3_path_prefix
    # @return [Vapi::TranscriptPlan] This is the plan for `call.artifact.transcript`. To disable, set
    #  `transcriptPlan.enabled` to false.
    attr_reader :transcript_plan
    # @return [String] This is the path where the recording will be uploaded. This is only used if you
    #  have provided S3 or GCP credentials on the Provider Credentials page in the
    #  Dashboard.
    #  If credential.s3PathPrefix or credential.bucketPlan.path is set, this will
    #  append to it.
    #  Usage:
    #  - If you want to upload the recording to a specific path, set this to the path.
    #  Example: `/my-assistant-recordings`.
    #  - If you want to upload the recording to the root of the bucket, set this to
    #  `/`.
    #  @default '/'
    attr_reader :recording_path
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param recording_enabled [Boolean] This determines whether assistant's calls are recorded. Defaults to true.
    #  Usage:
    #  - If you don't want to record the calls, set this to false.
    #  - If you want to record the calls when `assistant.hipaaEnabled` (deprecated) or
    #  `assistant.compliancePlan.hipaaEnabled` explicity set this to true and make sure
    #  to provide S3 or GCP credentials on the Provider Credentials page in the
    #  Dashboard.
    #  You can find the recording at `call.artifact.recordingUrl` and
    #  `call.artifact.stereoRecordingUrl` after the call is ended.
    #  @default true
    # @param recording_format [Vapi::ArtifactPlanRecordingFormat] This determines the format of the recording. Defaults to `wav;l16`.
    #  @default 'wav;l16'
    # @param video_recording_enabled [Boolean] This determines whether the video is recorded during the call. Defaults to
    #  false. Only relevant for `webCall` type.
    #  You can find the video recording at `call.artifact.videoRecordingUrl` after the
    #  call is ended.
    #  @default false
    # @param pcap_enabled [Boolean] This determines whether the SIP packet capture is enabled. Defaults to true.
    #  Only relevant for `phone` type calls where phone number's provider is `vapi` or
    #  `byo-phone-number`.
    #  You can find the packet capture at `call.artifact.pcapUrl` after the call is
    #  ended.
    #  @default true
    # @param pcap_s_3_path_prefix [String] This is the path where the SIP packet capture will be uploaded. This is only
    #  used if you have provided S3 or GCP credentials on the Provider Credentials page
    #  in the Dashboard.
    #  If credential.s3PathPrefix or credential.bucketPlan.path is set, this will
    #  append to it.
    #  Usage:
    #  - If you want to upload the packet capture to a specific path, set this to the
    #  path. Example: `/my-assistant-captures`.
    #  - If you want to upload the packet capture to the root of the bucket, set this
    #  to `/`.
    #  @default '/'
    # @param transcript_plan [Vapi::TranscriptPlan] This is the plan for `call.artifact.transcript`. To disable, set
    #  `transcriptPlan.enabled` to false.
    # @param recording_path [String] This is the path where the recording will be uploaded. This is only used if you
    #  have provided S3 or GCP credentials on the Provider Credentials page in the
    #  Dashboard.
    #  If credential.s3PathPrefix or credential.bucketPlan.path is set, this will
    #  append to it.
    #  Usage:
    #  - If you want to upload the recording to a specific path, set this to the path.
    #  Example: `/my-assistant-recordings`.
    #  - If you want to upload the recording to the root of the bucket, set this to
    #  `/`.
    #  @default '/'
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ArtifactPlan]
    def initialize(recording_enabled: OMIT, recording_format: OMIT, video_recording_enabled: OMIT, pcap_enabled: OMIT,
                   pcap_s_3_path_prefix: OMIT, transcript_plan: OMIT, recording_path: OMIT, additional_properties: nil)
      @recording_enabled = recording_enabled if recording_enabled != OMIT
      @recording_format = recording_format if recording_format != OMIT
      @video_recording_enabled = video_recording_enabled if video_recording_enabled != OMIT
      @pcap_enabled = pcap_enabled if pcap_enabled != OMIT
      @pcap_s_3_path_prefix = pcap_s_3_path_prefix if pcap_s_3_path_prefix != OMIT
      @transcript_plan = transcript_plan if transcript_plan != OMIT
      @recording_path = recording_path if recording_path != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "recordingEnabled": recording_enabled,
        "recordingFormat": recording_format,
        "videoRecordingEnabled": video_recording_enabled,
        "pcapEnabled": pcap_enabled,
        "pcapS3PathPrefix": pcap_s_3_path_prefix,
        "transcriptPlan": transcript_plan,
        "recordingPath": recording_path
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ArtifactPlan
    #
    # @param json_object [String]
    # @return [Vapi::ArtifactPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      recording_enabled = parsed_json["recordingEnabled"]
      recording_format = parsed_json["recordingFormat"]
      video_recording_enabled = parsed_json["videoRecordingEnabled"]
      pcap_enabled = parsed_json["pcapEnabled"]
      pcap_s_3_path_prefix = parsed_json["pcapS3PathPrefix"]
      if parsed_json["transcriptPlan"].nil?
        transcript_plan = nil
      else
        transcript_plan = parsed_json["transcriptPlan"].to_json
        transcript_plan = Vapi::TranscriptPlan.from_json(json_object: transcript_plan)
      end
      recording_path = parsed_json["recordingPath"]
      new(
        recording_enabled: recording_enabled,
        recording_format: recording_format,
        video_recording_enabled: video_recording_enabled,
        pcap_enabled: pcap_enabled,
        pcap_s_3_path_prefix: pcap_s_3_path_prefix,
        transcript_plan: transcript_plan,
        recording_path: recording_path,
        additional_properties: struct
      )
    end

    # Serialize an instance of ArtifactPlan to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.recording_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.recording_enabled is not the expected type, validation failed.")
      obj.recording_format&.is_a?(Vapi::ArtifactPlanRecordingFormat) != false || raise("Passed value for field obj.recording_format is not the expected type, validation failed.")
      obj.video_recording_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.video_recording_enabled is not the expected type, validation failed.")
      obj.pcap_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.pcap_enabled is not the expected type, validation failed.")
      obj.pcap_s_3_path_prefix&.is_a?(String) != false || raise("Passed value for field obj.pcap_s_3_path_prefix is not the expected type, validation failed.")
      obj.transcript_plan.nil? || Vapi::TranscriptPlan.validate_raw(obj: obj.transcript_plan)
      obj.recording_path&.is_a?(String) != false || raise("Passed value for field obj.recording_path is not the expected type, validation failed.")
    end
  end
end
