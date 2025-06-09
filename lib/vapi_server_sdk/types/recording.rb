# frozen_string_literal: true
require_relative "mono"
require "ostruct"
require "json"

module Vapi
  class Recording
  # @return [String] This is the stereo recording url for the call. To enable, set
#  `assistant.artifactPlan.recordingEnabled`.
    attr_reader :stereo_url
  # @return [String] This is the video recording url for the call. To enable, set
#  `assistant.artifactPlan.videoRecordingEnabled`.
    attr_reader :video_url
  # @return [Float] This is video recording start delay in ms. To enable, set
#  `assistant.artifactPlan.videoRecordingEnabled`. This can be used to align the
#  playback of the recording with artifact.messages timestamps.
    attr_reader :video_recording_start_delay_seconds
  # @return [Vapi::Mono] This is the mono recording url for the call. To enable, set
#  `assistant.artifactPlan.recordingEnabled`.
    attr_reader :mono
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param stereo_url [String] This is the stereo recording url for the call. To enable, set
#  `assistant.artifactPlan.recordingEnabled`.
    # @param video_url [String] This is the video recording url for the call. To enable, set
#  `assistant.artifactPlan.videoRecordingEnabled`.
    # @param video_recording_start_delay_seconds [Float] This is video recording start delay in ms. To enable, set
#  `assistant.artifactPlan.videoRecordingEnabled`. This can be used to align the
#  playback of the recording with artifact.messages timestamps.
    # @param mono [Vapi::Mono] This is the mono recording url for the call. To enable, set
#  `assistant.artifactPlan.recordingEnabled`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Recording]
    def initialize(stereo_url: OMIT, video_url: OMIT, video_recording_start_delay_seconds: OMIT, mono: OMIT, additional_properties: nil)
      @stereo_url = stereo_url if stereo_url != OMIT
      @video_url = video_url if video_url != OMIT
      @video_recording_start_delay_seconds = video_recording_start_delay_seconds if video_recording_start_delay_seconds != OMIT
      @mono = mono if mono != OMIT
      @additional_properties = additional_properties
      @_field_set = { "stereoUrl": stereo_url, "videoUrl": video_url, "videoRecordingStartDelaySeconds": video_recording_start_delay_seconds, "mono": mono }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Recording
    #
    # @param json_object [String] 
    # @return [Vapi::Recording]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      stereo_url = parsed_json["stereoUrl"]
      video_url = parsed_json["videoUrl"]
      video_recording_start_delay_seconds = parsed_json["videoRecordingStartDelaySeconds"]
      unless parsed_json["mono"].nil?
        mono = parsed_json["mono"].to_json
        mono = Vapi::Mono.from_json(json_object: mono)
      else
        mono = nil
      end
      new(
        stereo_url: stereo_url,
        video_url: video_url,
        video_recording_start_delay_seconds: video_recording_start_delay_seconds,
        mono: mono,
        additional_properties: struct
      )
    end
# Serialize an instance of Recording to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.stereo_url&.is_a?(String) != false || raise("Passed value for field obj.stereo_url is not the expected type, validation failed.")
      obj.video_url&.is_a?(String) != false || raise("Passed value for field obj.video_url is not the expected type, validation failed.")
      obj.video_recording_start_delay_seconds&.is_a?(Float) != false || raise("Passed value for field obj.video_recording_start_delay_seconds is not the expected type, validation failed.")
      obj.mono.nil? || Vapi::Mono.validate_raw(obj: obj.mono)
    end
  end
end