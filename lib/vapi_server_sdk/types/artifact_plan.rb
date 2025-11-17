# frozen_string_literal: true

require_relative "artifact_plan_recording_format"
require_relative "transcript_plan"
require_relative "create_scorecard_dto"
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
    # @return [Boolean] This determines whether to use custom storage (S3 or GCP) for call recordings
    #  when storage credentials are configured.
    #  When set to false, recordings will be stored on Vapi's storage instead of your
    #  custom storage, even if you have custom storage credentials configured.
    #  Usage:
    #  - Set to false if you have custom storage configured but want to store
    #  recordings on Vapi's storage for this assistant.
    #  - Set to true (or leave unset) to use your custom storage for recordings when
    #  available.
    #  @default true
    attr_reader :recording_use_custom_storage_enabled
    # @return [Boolean] This determines whether the video is recorded during the call. Defaults to
    #  false. Only relevant for `webCall` type.
    #  You can find the video recording at `call.artifact.videoRecordingUrl` after the
    #  call is ended.
    #  @default false
    attr_reader :video_recording_enabled
    # @return [Boolean] This determines whether the artifact contains the full message history, even
    #  after handoff context engineering. Defaults to false.
    attr_reader :full_message_history_enabled
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
    # @return [Boolean] This determines whether to use custom storage (S3 or GCP) for SIP packet
    #  captures when storage credentials are configured.
    #  When set to false, packet captures will be stored on Vapi's storage instead of
    #  your custom storage, even if you have custom storage credentials configured.
    #  Usage:
    #  - Set to false if you have custom storage configured but want to store packet
    #  captures on Vapi's storage for this assistant.
    #  - Set to true (or leave unset) to use your custom storage for packet captures
    #  when available.
    #  @default true
    attr_reader :pcap_use_custom_storage_enabled
    # @return [Boolean] This determines whether the call logs are enabled. Defaults to true.
    #  @default true
    attr_reader :logging_enabled
    # @return [Boolean] This determines whether to use custom storage (S3 or GCP) for call logs when
    #  storage credentials are configured.
    #  When set to false, logs will be stored on Vapi's storage instead of your custom
    #  storage, even if you have custom storage credentials configured.
    #  Usage:
    #  - Set to false if you have custom storage configured but want to store logs on
    #  Vapi's storage for this assistant.
    #  - Set to true (or leave unset) to use your custom storage for logs when
    #  available.
    #  @default true
    attr_reader :logging_use_custom_storage_enabled
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
    # @return [Array<String>] This is an array of structured output IDs to be calculated during the call.
    #  The outputs will be extracted and stored in `call.artifact.structuredOutputs`
    #  after the call is ended.
    attr_reader :structured_output_ids
    # @return [Array<String>] This is an array of scorecard IDs that will be evaluated based on the structured
    #  outputs extracted during the call.
    #  The scorecards will be evaluated and the results will be stored in
    #  `call.artifact.scorecards` after the call has ended.
    attr_reader :scorecard_ids
    # @return [Array<Vapi::CreateScorecardDto>] This is the array of scorecards that will be evaluated based on the structured
    #  outputs extracted during the call.
    #  The scorecards will be evaluated and the results will be stored in
    #  `call.artifact.scorecards` after the call has ended.
    attr_reader :scorecards
    # @return [String] This is the path where the call logs will be uploaded. This is only used if you
    #  have provided S3 or GCP credentials on the Provider Credentials page in the
    #  Dashboard.
    #  If credential.s3PathPrefix or credential.bucketPlan.path is set, this will
    #  append to it.
    #  Usage:
    #  - If you want to upload the call logs to a specific path, set this to the path.
    #  Example: `/my-assistant-logs`.
    #  - If you want to upload the call logs to the root of the bucket, set this to
    #  `/`.
    #  @default '/'
    attr_reader :logging_path
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
    # @param recording_use_custom_storage_enabled [Boolean] This determines whether to use custom storage (S3 or GCP) for call recordings
    #  when storage credentials are configured.
    #  When set to false, recordings will be stored on Vapi's storage instead of your
    #  custom storage, even if you have custom storage credentials configured.
    #  Usage:
    #  - Set to false if you have custom storage configured but want to store
    #  recordings on Vapi's storage for this assistant.
    #  - Set to true (or leave unset) to use your custom storage for recordings when
    #  available.
    #  @default true
    # @param video_recording_enabled [Boolean] This determines whether the video is recorded during the call. Defaults to
    #  false. Only relevant for `webCall` type.
    #  You can find the video recording at `call.artifact.videoRecordingUrl` after the
    #  call is ended.
    #  @default false
    # @param full_message_history_enabled [Boolean] This determines whether the artifact contains the full message history, even
    #  after handoff context engineering. Defaults to false.
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
    # @param pcap_use_custom_storage_enabled [Boolean] This determines whether to use custom storage (S3 or GCP) for SIP packet
    #  captures when storage credentials are configured.
    #  When set to false, packet captures will be stored on Vapi's storage instead of
    #  your custom storage, even if you have custom storage credentials configured.
    #  Usage:
    #  - Set to false if you have custom storage configured but want to store packet
    #  captures on Vapi's storage for this assistant.
    #  - Set to true (or leave unset) to use your custom storage for packet captures
    #  when available.
    #  @default true
    # @param logging_enabled [Boolean] This determines whether the call logs are enabled. Defaults to true.
    #  @default true
    # @param logging_use_custom_storage_enabled [Boolean] This determines whether to use custom storage (S3 or GCP) for call logs when
    #  storage credentials are configured.
    #  When set to false, logs will be stored on Vapi's storage instead of your custom
    #  storage, even if you have custom storage credentials configured.
    #  Usage:
    #  - Set to false if you have custom storage configured but want to store logs on
    #  Vapi's storage for this assistant.
    #  - Set to true (or leave unset) to use your custom storage for logs when
    #  available.
    #  @default true
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
    # @param structured_output_ids [Array<String>] This is an array of structured output IDs to be calculated during the call.
    #  The outputs will be extracted and stored in `call.artifact.structuredOutputs`
    #  after the call is ended.
    # @param scorecard_ids [Array<String>] This is an array of scorecard IDs that will be evaluated based on the structured
    #  outputs extracted during the call.
    #  The scorecards will be evaluated and the results will be stored in
    #  `call.artifact.scorecards` after the call has ended.
    # @param scorecards [Array<Vapi::CreateScorecardDto>] This is the array of scorecards that will be evaluated based on the structured
    #  outputs extracted during the call.
    #  The scorecards will be evaluated and the results will be stored in
    #  `call.artifact.scorecards` after the call has ended.
    # @param logging_path [String] This is the path where the call logs will be uploaded. This is only used if you
    #  have provided S3 or GCP credentials on the Provider Credentials page in the
    #  Dashboard.
    #  If credential.s3PathPrefix or credential.bucketPlan.path is set, this will
    #  append to it.
    #  Usage:
    #  - If you want to upload the call logs to a specific path, set this to the path.
    #  Example: `/my-assistant-logs`.
    #  - If you want to upload the call logs to the root of the bucket, set this to
    #  `/`.
    #  @default '/'
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ArtifactPlan]
    def initialize(recording_enabled: OMIT, recording_format: OMIT, recording_use_custom_storage_enabled: OMIT,
                   video_recording_enabled: OMIT, full_message_history_enabled: OMIT, pcap_enabled: OMIT, pcap_s_3_path_prefix: OMIT, pcap_use_custom_storage_enabled: OMIT, logging_enabled: OMIT, logging_use_custom_storage_enabled: OMIT, transcript_plan: OMIT, recording_path: OMIT, structured_output_ids: OMIT, scorecard_ids: OMIT, scorecards: OMIT, logging_path: OMIT, additional_properties: nil)
      @recording_enabled = recording_enabled if recording_enabled != OMIT
      @recording_format = recording_format if recording_format != OMIT
      if recording_use_custom_storage_enabled != OMIT
        @recording_use_custom_storage_enabled = recording_use_custom_storage_enabled
      end
      @video_recording_enabled = video_recording_enabled if video_recording_enabled != OMIT
      @full_message_history_enabled = full_message_history_enabled if full_message_history_enabled != OMIT
      @pcap_enabled = pcap_enabled if pcap_enabled != OMIT
      @pcap_s_3_path_prefix = pcap_s_3_path_prefix if pcap_s_3_path_prefix != OMIT
      @pcap_use_custom_storage_enabled = pcap_use_custom_storage_enabled if pcap_use_custom_storage_enabled != OMIT
      @logging_enabled = logging_enabled if logging_enabled != OMIT
      if logging_use_custom_storage_enabled != OMIT
        @logging_use_custom_storage_enabled = logging_use_custom_storage_enabled
      end
      @transcript_plan = transcript_plan if transcript_plan != OMIT
      @recording_path = recording_path if recording_path != OMIT
      @structured_output_ids = structured_output_ids if structured_output_ids != OMIT
      @scorecard_ids = scorecard_ids if scorecard_ids != OMIT
      @scorecards = scorecards if scorecards != OMIT
      @logging_path = logging_path if logging_path != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "recordingEnabled": recording_enabled,
        "recordingFormat": recording_format,
        "recordingUseCustomStorageEnabled": recording_use_custom_storage_enabled,
        "videoRecordingEnabled": video_recording_enabled,
        "fullMessageHistoryEnabled": full_message_history_enabled,
        "pcapEnabled": pcap_enabled,
        "pcapS3PathPrefix": pcap_s_3_path_prefix,
        "pcapUseCustomStorageEnabled": pcap_use_custom_storage_enabled,
        "loggingEnabled": logging_enabled,
        "loggingUseCustomStorageEnabled": logging_use_custom_storage_enabled,
        "transcriptPlan": transcript_plan,
        "recordingPath": recording_path,
        "structuredOutputIds": structured_output_ids,
        "scorecardIds": scorecard_ids,
        "scorecards": scorecards,
        "loggingPath": logging_path
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
      recording_use_custom_storage_enabled = parsed_json["recordingUseCustomStorageEnabled"]
      video_recording_enabled = parsed_json["videoRecordingEnabled"]
      full_message_history_enabled = parsed_json["fullMessageHistoryEnabled"]
      pcap_enabled = parsed_json["pcapEnabled"]
      pcap_s_3_path_prefix = parsed_json["pcapS3PathPrefix"]
      pcap_use_custom_storage_enabled = parsed_json["pcapUseCustomStorageEnabled"]
      logging_enabled = parsed_json["loggingEnabled"]
      logging_use_custom_storage_enabled = parsed_json["loggingUseCustomStorageEnabled"]
      if parsed_json["transcriptPlan"].nil?
        transcript_plan = nil
      else
        transcript_plan = parsed_json["transcriptPlan"].to_json
        transcript_plan = Vapi::TranscriptPlan.from_json(json_object: transcript_plan)
      end
      recording_path = parsed_json["recordingPath"]
      structured_output_ids = parsed_json["structuredOutputIds"]
      scorecard_ids = parsed_json["scorecardIds"]
      scorecards = parsed_json["scorecards"]&.map do |item|
        item = item.to_json
        Vapi::CreateScorecardDto.from_json(json_object: item)
      end
      logging_path = parsed_json["loggingPath"]
      new(
        recording_enabled: recording_enabled,
        recording_format: recording_format,
        recording_use_custom_storage_enabled: recording_use_custom_storage_enabled,
        video_recording_enabled: video_recording_enabled,
        full_message_history_enabled: full_message_history_enabled,
        pcap_enabled: pcap_enabled,
        pcap_s_3_path_prefix: pcap_s_3_path_prefix,
        pcap_use_custom_storage_enabled: pcap_use_custom_storage_enabled,
        logging_enabled: logging_enabled,
        logging_use_custom_storage_enabled: logging_use_custom_storage_enabled,
        transcript_plan: transcript_plan,
        recording_path: recording_path,
        structured_output_ids: structured_output_ids,
        scorecard_ids: scorecard_ids,
        scorecards: scorecards,
        logging_path: logging_path,
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
      obj.recording_use_custom_storage_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.recording_use_custom_storage_enabled is not the expected type, validation failed.")
      obj.video_recording_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.video_recording_enabled is not the expected type, validation failed.")
      obj.full_message_history_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.full_message_history_enabled is not the expected type, validation failed.")
      obj.pcap_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.pcap_enabled is not the expected type, validation failed.")
      obj.pcap_s_3_path_prefix&.is_a?(String) != false || raise("Passed value for field obj.pcap_s_3_path_prefix is not the expected type, validation failed.")
      obj.pcap_use_custom_storage_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.pcap_use_custom_storage_enabled is not the expected type, validation failed.")
      obj.logging_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.logging_enabled is not the expected type, validation failed.")
      obj.logging_use_custom_storage_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.logging_use_custom_storage_enabled is not the expected type, validation failed.")
      obj.transcript_plan.nil? || Vapi::TranscriptPlan.validate_raw(obj: obj.transcript_plan)
      obj.recording_path&.is_a?(String) != false || raise("Passed value for field obj.recording_path is not the expected type, validation failed.")
      obj.structured_output_ids&.is_a?(Array) != false || raise("Passed value for field obj.structured_output_ids is not the expected type, validation failed.")
      obj.scorecard_ids&.is_a?(Array) != false || raise("Passed value for field obj.scorecard_ids is not the expected type, validation failed.")
      obj.scorecards&.is_a?(Array) != false || raise("Passed value for field obj.scorecards is not the expected type, validation failed.")
      obj.logging_path&.is_a?(String) != false || raise("Passed value for field obj.logging_path is not the expected type, validation failed.")
    end
  end
end
