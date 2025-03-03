# frozen_string_literal: true

require_relative "artifact_messages_item"
require_relative "open_ai_message"
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
    # @return [String] This is the transcript of the call. This is derived from `artifact.messages` but
    #  provided for convenience.
    attr_reader :transcript
    # @return [String] This is the packet capture url for the call. This is only available for `phone`
    #  type calls where phone number's provider is `vapi` or `byo-phone-number`.
    attr_reader :pcap_url
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
    # @param transcript [String] This is the transcript of the call. This is derived from `artifact.messages` but
    #  provided for convenience.
    # @param pcap_url [String] This is the packet capture url for the call. This is only available for `phone`
    #  type calls where phone number's provider is `vapi` or `byo-phone-number`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Artifact]
    def initialize(messages: OMIT, messages_open_ai_formatted: OMIT, recording_url: OMIT, stereo_recording_url: OMIT,
                   video_recording_url: OMIT, video_recording_start_delay_seconds: OMIT, transcript: OMIT, pcap_url: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @messages_open_ai_formatted = messages_open_ai_formatted if messages_open_ai_formatted != OMIT
      @recording_url = recording_url if recording_url != OMIT
      @stereo_recording_url = stereo_recording_url if stereo_recording_url != OMIT
      @video_recording_url = video_recording_url if video_recording_url != OMIT
      if video_recording_start_delay_seconds != OMIT
        @video_recording_start_delay_seconds = video_recording_start_delay_seconds
      end
      @transcript = transcript if transcript != OMIT
      @pcap_url = pcap_url if pcap_url != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "messagesOpenAIFormatted": messages_open_ai_formatted,
        "recordingUrl": recording_url,
        "stereoRecordingUrl": stereo_recording_url,
        "videoRecordingUrl": video_recording_url,
        "videoRecordingStartDelaySeconds": video_recording_start_delay_seconds,
        "transcript": transcript,
        "pcapUrl": pcap_url
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
      transcript = parsed_json["transcript"]
      pcap_url = parsed_json["pcapUrl"]
      new(
        messages: messages,
        messages_open_ai_formatted: messages_open_ai_formatted,
        recording_url: recording_url,
        stereo_recording_url: stereo_recording_url,
        video_recording_url: video_recording_url,
        video_recording_start_delay_seconds: video_recording_start_delay_seconds,
        transcript: transcript,
        pcap_url: pcap_url,
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
      obj.transcript&.is_a?(String) != false || raise("Passed value for field obj.transcript is not the expected type, validation failed.")
      obj.pcap_url&.is_a?(String) != false || raise("Passed value for field obj.pcap_url is not the expected type, validation failed.")
    end
  end
end
