# frozen_string_literal: true

require_relative "artifact_messages_item"
require_relative "open_ai_message"
require_relative "recording"
require_relative "node_artifact"
require_relative "performance_metrics"
require "date"
require "ostruct"
require "json"

module Vapi
  class Artifact
    # @return [Array<Vapi::ArtifactMessagesItem>] These are the messages that were spoken during the call.
    attr_reader :messages
    # @return [Array<Vapi::OpenAiMessage>] These are the messages that were spoken during the call, formatted for OpenAI.
    attr_reader :messages_open_ai_formatted
    # @return [String] This is the recording url for the call. To enable, set
    #  `assistant.artifactPlan.recordingEnabled`.
    attr_reader :recording_url
    # @return [String] This is the stereo recording url for the call. To enable, set
    #  `assistant.artifactPlan.recordingEnabled`.
    attr_reader :stereo_recording_url
    # @return [String] This is video recording url for the call. To enable, set
    #  `assistant.artifactPlan.videoRecordingEnabled`.
    attr_reader :video_recording_url
    # @return [Float] This is video recording start delay in ms. To enable, set
    #  `assistant.artifactPlan.videoRecordingEnabled`. This can be used to align the
    #  playback of the recording with artifact.messages timestamps.
    attr_reader :video_recording_start_delay_seconds
    # @return [Vapi::Recording] This is the recording url for the call. To enable, set
    #  `assistant.artifactPlan.recordingEnabled`.
    attr_reader :recording
    # @return [String] This is the transcript of the call. This is derived from `artifact.messages` but
    #  provided for convenience.
    attr_reader :transcript
    # @return [String] This is the packet capture url for the call. This is only available for `phone`
    #  type calls where phone number's provider is `vapi` or `byo-phone-number`.
    attr_reader :pcap_url
    # @return [String] This is the url for the call logs. This includes all logging output during the
    #  call for debugging purposes.
    attr_reader :log_url
    # @return [Array<Vapi::NodeArtifact>] This is the history of workflow nodes that were executed during the call.
    attr_reader :nodes
    # @return [Hash{String => Object}] These are the variable values at the end of the workflow execution.
    attr_reader :variable_values
    # @return [Vapi::PerformanceMetrics] This is the performance metrics for the call. It contains the turn latency,
    #  broken down by component.
    attr_reader :performance_metrics
    # @return [Hash{String => Object}] These are the structured outputs that will be extracted from the call.
    #  To enable, set `assistant.artifactPlan.structuredOutputIds` with the IDs of the
    #  structured outputs you want to extract.
    attr_reader :structured_outputs
    # @return [Hash{String => Object}] These are the scorecards that have been evaluated based on the structured
    #  outputs extracted during the call.
    #  To enable, set `assistant.artifactPlan.scorecardIds` or
    #  `assistant.artifactPlan.scorecards` with the IDs or objects of the scorecards
    #  you want to evaluate.
    attr_reader :scorecards
    # @return [Array<String>] These are the transfer records from warm transfers, including destinations,
    #  transcripts, and status.
    attr_reader :transfers
    # @return [DateTime] This is when the structured outputs were last updated
    attr_reader :structured_outputs_last_updated_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::ArtifactMessagesItem>] These are the messages that were spoken during the call.
    # @param messages_open_ai_formatted [Array<Vapi::OpenAiMessage>] These are the messages that were spoken during the call, formatted for OpenAI.
    # @param recording_url [String] This is the recording url for the call. To enable, set
    #  `assistant.artifactPlan.recordingEnabled`.
    # @param stereo_recording_url [String] This is the stereo recording url for the call. To enable, set
    #  `assistant.artifactPlan.recordingEnabled`.
    # @param video_recording_url [String] This is video recording url for the call. To enable, set
    #  `assistant.artifactPlan.videoRecordingEnabled`.
    # @param video_recording_start_delay_seconds [Float] This is video recording start delay in ms. To enable, set
    #  `assistant.artifactPlan.videoRecordingEnabled`. This can be used to align the
    #  playback of the recording with artifact.messages timestamps.
    # @param recording [Vapi::Recording] This is the recording url for the call. To enable, set
    #  `assistant.artifactPlan.recordingEnabled`.
    # @param transcript [String] This is the transcript of the call. This is derived from `artifact.messages` but
    #  provided for convenience.
    # @param pcap_url [String] This is the packet capture url for the call. This is only available for `phone`
    #  type calls where phone number's provider is `vapi` or `byo-phone-number`.
    # @param log_url [String] This is the url for the call logs. This includes all logging output during the
    #  call for debugging purposes.
    # @param nodes [Array<Vapi::NodeArtifact>] This is the history of workflow nodes that were executed during the call.
    # @param variable_values [Hash{String => Object}] These are the variable values at the end of the workflow execution.
    # @param performance_metrics [Vapi::PerformanceMetrics] This is the performance metrics for the call. It contains the turn latency,
    #  broken down by component.
    # @param structured_outputs [Hash{String => Object}] These are the structured outputs that will be extracted from the call.
    #  To enable, set `assistant.artifactPlan.structuredOutputIds` with the IDs of the
    #  structured outputs you want to extract.
    # @param scorecards [Hash{String => Object}] These are the scorecards that have been evaluated based on the structured
    #  outputs extracted during the call.
    #  To enable, set `assistant.artifactPlan.scorecardIds` or
    #  `assistant.artifactPlan.scorecards` with the IDs or objects of the scorecards
    #  you want to evaluate.
    # @param transfers [Array<String>] These are the transfer records from warm transfers, including destinations,
    #  transcripts, and status.
    # @param structured_outputs_last_updated_at [DateTime] This is when the structured outputs were last updated
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Artifact]
    def initialize(messages: OMIT, messages_open_ai_formatted: OMIT, recording_url: OMIT, stereo_recording_url: OMIT,
                   video_recording_url: OMIT, video_recording_start_delay_seconds: OMIT, recording: OMIT, transcript: OMIT, pcap_url: OMIT, log_url: OMIT, nodes: OMIT, variable_values: OMIT, performance_metrics: OMIT, structured_outputs: OMIT, scorecards: OMIT, transfers: OMIT, structured_outputs_last_updated_at: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @messages_open_ai_formatted = messages_open_ai_formatted if messages_open_ai_formatted != OMIT
      @recording_url = recording_url if recording_url != OMIT
      @stereo_recording_url = stereo_recording_url if stereo_recording_url != OMIT
      @video_recording_url = video_recording_url if video_recording_url != OMIT
      if video_recording_start_delay_seconds != OMIT
        @video_recording_start_delay_seconds = video_recording_start_delay_seconds
      end
      @recording = recording if recording != OMIT
      @transcript = transcript if transcript != OMIT
      @pcap_url = pcap_url if pcap_url != OMIT
      @log_url = log_url if log_url != OMIT
      @nodes = nodes if nodes != OMIT
      @variable_values = variable_values if variable_values != OMIT
      @performance_metrics = performance_metrics if performance_metrics != OMIT
      @structured_outputs = structured_outputs if structured_outputs != OMIT
      @scorecards = scorecards if scorecards != OMIT
      @transfers = transfers if transfers != OMIT
      if structured_outputs_last_updated_at != OMIT
        @structured_outputs_last_updated_at = structured_outputs_last_updated_at
      end
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "messagesOpenAIFormatted": messages_open_ai_formatted,
        "recordingUrl": recording_url,
        "stereoRecordingUrl": stereo_recording_url,
        "videoRecordingUrl": video_recording_url,
        "videoRecordingStartDelaySeconds": video_recording_start_delay_seconds,
        "recording": recording,
        "transcript": transcript,
        "pcapUrl": pcap_url,
        "logUrl": log_url,
        "nodes": nodes,
        "variableValues": variable_values,
        "performanceMetrics": performance_metrics,
        "structuredOutputs": structured_outputs,
        "scorecards": scorecards,
        "transfers": transfers,
        "structuredOutputsLastUpdatedAt": structured_outputs_last_updated_at
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Artifact
    #
    # @param json_object [String]
    # @return [Vapi::Artifact]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::ArtifactMessagesItem.from_json(json_object: item)
      end
      messages_open_ai_formatted = parsed_json["messagesOpenAIFormatted"]&.map do |item|
        item = item.to_json
        Vapi::OpenAiMessage.from_json(json_object: item)
      end
      recording_url = parsed_json["recordingUrl"]
      stereo_recording_url = parsed_json["stereoRecordingUrl"]
      video_recording_url = parsed_json["videoRecordingUrl"]
      video_recording_start_delay_seconds = parsed_json["videoRecordingStartDelaySeconds"]
      if parsed_json["recording"].nil?
        recording = nil
      else
        recording = parsed_json["recording"].to_json
        recording = Vapi::Recording.from_json(json_object: recording)
      end
      transcript = parsed_json["transcript"]
      pcap_url = parsed_json["pcapUrl"]
      log_url = parsed_json["logUrl"]
      nodes = parsed_json["nodes"]&.map do |item|
        item = item.to_json
        Vapi::NodeArtifact.from_json(json_object: item)
      end
      variable_values = parsed_json["variableValues"]
      if parsed_json["performanceMetrics"].nil?
        performance_metrics = nil
      else
        performance_metrics = parsed_json["performanceMetrics"].to_json
        performance_metrics = Vapi::PerformanceMetrics.from_json(json_object: performance_metrics)
      end
      structured_outputs = parsed_json["structuredOutputs"]
      scorecards = parsed_json["scorecards"]
      transfers = parsed_json["transfers"]
      structured_outputs_last_updated_at = unless parsed_json["structuredOutputsLastUpdatedAt"].nil?
                                             DateTime.parse(parsed_json["structuredOutputsLastUpdatedAt"])
                                           end
      new(
        messages: messages,
        messages_open_ai_formatted: messages_open_ai_formatted,
        recording_url: recording_url,
        stereo_recording_url: stereo_recording_url,
        video_recording_url: video_recording_url,
        video_recording_start_delay_seconds: video_recording_start_delay_seconds,
        recording: recording,
        transcript: transcript,
        pcap_url: pcap_url,
        log_url: log_url,
        nodes: nodes,
        variable_values: variable_values,
        performance_metrics: performance_metrics,
        structured_outputs: structured_outputs,
        scorecards: scorecards,
        transfers: transfers,
        structured_outputs_last_updated_at: structured_outputs_last_updated_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of Artifact to a JSON object
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
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.messages_open_ai_formatted&.is_a?(Array) != false || raise("Passed value for field obj.messages_open_ai_formatted is not the expected type, validation failed.")
      obj.recording_url&.is_a?(String) != false || raise("Passed value for field obj.recording_url is not the expected type, validation failed.")
      obj.stereo_recording_url&.is_a?(String) != false || raise("Passed value for field obj.stereo_recording_url is not the expected type, validation failed.")
      obj.video_recording_url&.is_a?(String) != false || raise("Passed value for field obj.video_recording_url is not the expected type, validation failed.")
      obj.video_recording_start_delay_seconds&.is_a?(Float) != false || raise("Passed value for field obj.video_recording_start_delay_seconds is not the expected type, validation failed.")
      obj.recording.nil? || Vapi::Recording.validate_raw(obj: obj.recording)
      obj.transcript&.is_a?(String) != false || raise("Passed value for field obj.transcript is not the expected type, validation failed.")
      obj.pcap_url&.is_a?(String) != false || raise("Passed value for field obj.pcap_url is not the expected type, validation failed.")
      obj.log_url&.is_a?(String) != false || raise("Passed value for field obj.log_url is not the expected type, validation failed.")
      obj.nodes&.is_a?(Array) != false || raise("Passed value for field obj.nodes is not the expected type, validation failed.")
      obj.variable_values&.is_a?(Hash) != false || raise("Passed value for field obj.variable_values is not the expected type, validation failed.")
      obj.performance_metrics.nil? || Vapi::PerformanceMetrics.validate_raw(obj: obj.performance_metrics)
      obj.structured_outputs&.is_a?(Hash) != false || raise("Passed value for field obj.structured_outputs is not the expected type, validation failed.")
      obj.scorecards&.is_a?(Hash) != false || raise("Passed value for field obj.scorecards is not the expected type, validation failed.")
      obj.transfers&.is_a?(Array) != false || raise("Passed value for field obj.transfers is not the expected type, validation failed.")
      obj.structured_outputs_last_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.structured_outputs_last_updated_at is not the expected type, validation failed.")
    end
  end
end
