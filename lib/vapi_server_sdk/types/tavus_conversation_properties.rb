# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class TavusConversationProperties
  # @return [Float] The maximum duration of the call in seconds. The default `maxCallDuration` is
#  3600 seconds (1 hour).
#  Once the time limit specified by this parameter has been reached, the
#  conversation will automatically shut down.
    attr_reader :max_call_duration
  # @return [Float] The duration in seconds after which the call will be automatically shut down
#  once the last participant leaves.
    attr_reader :participant_left_timeout
  # @return [Float] Starting from conversation creation, the duration in seconds after which the
#  call will be automatically shut down if no participant joins the call.
#  Default is 300 seconds (5 minutes).
    attr_reader :participant_absent_timeout
  # @return [Boolean] If true, the user will be able to record the conversation.
    attr_reader :enable_recording
  # @return [Boolean] If true, the user will be able to transcribe the conversation.
#  You can find more instructions on displaying transcriptions if you are using
#  your custom DailyJS components here.
#  You need to have an event listener on Daily that listens for `app-messages`.
    attr_reader :enable_transcription
  # @return [Boolean] If true, the background will be replaced with a greenscreen (RGB values: `[0,
#  255, 155]`).
#  You can use WebGL on the frontend to make the greenscreen transparent or change
#  its color.
    attr_reader :apply_greenscreen
  # @return [String] The language of the conversation. Please provide the **full language name**, not
#  the two-letter code.
#  If you are using your own TTS voice, please ensure it supports the language you
#  provide.
#  If you are using a stock replica or default persona, please note that only
#  ElevenLabs and Cartesia supported languages are available.
#  You can find a full list of supported languages for Cartesia here, for
#  ElevenLabs here, and for PlayHT here.
    attr_reader :language
  # @return [String] The name of the S3 bucket where the recording will be stored.
    attr_reader :recording_s_3_bucket_name
  # @return [String] The region of the S3 bucket where the recording will be stored.
    attr_reader :recording_s_3_bucket_region
  # @return [String] The ARN of the role that will be assumed to access the S3 bucket.
    attr_reader :aws_assume_role_arn
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param max_call_duration [Float] The maximum duration of the call in seconds. The default `maxCallDuration` is
#  3600 seconds (1 hour).
#  Once the time limit specified by this parameter has been reached, the
#  conversation will automatically shut down.
    # @param participant_left_timeout [Float] The duration in seconds after which the call will be automatically shut down
#  once the last participant leaves.
    # @param participant_absent_timeout [Float] Starting from conversation creation, the duration in seconds after which the
#  call will be automatically shut down if no participant joins the call.
#  Default is 300 seconds (5 minutes).
    # @param enable_recording [Boolean] If true, the user will be able to record the conversation.
    # @param enable_transcription [Boolean] If true, the user will be able to transcribe the conversation.
#  You can find more instructions on displaying transcriptions if you are using
#  your custom DailyJS components here.
#  You need to have an event listener on Daily that listens for `app-messages`.
    # @param apply_greenscreen [Boolean] If true, the background will be replaced with a greenscreen (RGB values: `[0,
#  255, 155]`).
#  You can use WebGL on the frontend to make the greenscreen transparent or change
#  its color.
    # @param language [String] The language of the conversation. Please provide the **full language name**, not
#  the two-letter code.
#  If you are using your own TTS voice, please ensure it supports the language you
#  provide.
#  If you are using a stock replica or default persona, please note that only
#  ElevenLabs and Cartesia supported languages are available.
#  You can find a full list of supported languages for Cartesia here, for
#  ElevenLabs here, and for PlayHT here.
    # @param recording_s_3_bucket_name [String] The name of the S3 bucket where the recording will be stored.
    # @param recording_s_3_bucket_region [String] The region of the S3 bucket where the recording will be stored.
    # @param aws_assume_role_arn [String] The ARN of the role that will be assumed to access the S3 bucket.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TavusConversationProperties]
    def initialize(max_call_duration: OMIT, participant_left_timeout: OMIT, participant_absent_timeout: OMIT, enable_recording: OMIT, enable_transcription: OMIT, apply_greenscreen: OMIT, language: OMIT, recording_s_3_bucket_name: OMIT, recording_s_3_bucket_region: OMIT, aws_assume_role_arn: OMIT, additional_properties: nil)
      @max_call_duration = max_call_duration if max_call_duration != OMIT
      @participant_left_timeout = participant_left_timeout if participant_left_timeout != OMIT
      @participant_absent_timeout = participant_absent_timeout if participant_absent_timeout != OMIT
      @enable_recording = enable_recording if enable_recording != OMIT
      @enable_transcription = enable_transcription if enable_transcription != OMIT
      @apply_greenscreen = apply_greenscreen if apply_greenscreen != OMIT
      @language = language if language != OMIT
      @recording_s_3_bucket_name = recording_s_3_bucket_name if recording_s_3_bucket_name != OMIT
      @recording_s_3_bucket_region = recording_s_3_bucket_region if recording_s_3_bucket_region != OMIT
      @aws_assume_role_arn = aws_assume_role_arn if aws_assume_role_arn != OMIT
      @additional_properties = additional_properties
      @_field_set = { "maxCallDuration": max_call_duration, "participantLeftTimeout": participant_left_timeout, "participantAbsentTimeout": participant_absent_timeout, "enableRecording": enable_recording, "enableTranscription": enable_transcription, "applyGreenscreen": apply_greenscreen, "language": language, "recordingS3BucketName": recording_s_3_bucket_name, "recordingS3BucketRegion": recording_s_3_bucket_region, "awsAssumeRoleArn": aws_assume_role_arn }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TavusConversationProperties
    #
    # @param json_object [String] 
    # @return [Vapi::TavusConversationProperties]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      max_call_duration = parsed_json["maxCallDuration"]
      participant_left_timeout = parsed_json["participantLeftTimeout"]
      participant_absent_timeout = parsed_json["participantAbsentTimeout"]
      enable_recording = parsed_json["enableRecording"]
      enable_transcription = parsed_json["enableTranscription"]
      apply_greenscreen = parsed_json["applyGreenscreen"]
      language = parsed_json["language"]
      recording_s_3_bucket_name = parsed_json["recordingS3BucketName"]
      recording_s_3_bucket_region = parsed_json["recordingS3BucketRegion"]
      aws_assume_role_arn = parsed_json["awsAssumeRoleArn"]
      new(
        max_call_duration: max_call_duration,
        participant_left_timeout: participant_left_timeout,
        participant_absent_timeout: participant_absent_timeout,
        enable_recording: enable_recording,
        enable_transcription: enable_transcription,
        apply_greenscreen: apply_greenscreen,
        language: language,
        recording_s_3_bucket_name: recording_s_3_bucket_name,
        recording_s_3_bucket_region: recording_s_3_bucket_region,
        aws_assume_role_arn: aws_assume_role_arn,
        additional_properties: struct
      )
    end
# Serialize an instance of TavusConversationProperties to a JSON object
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
      obj.max_call_duration&.is_a?(Float) != false || raise("Passed value for field obj.max_call_duration is not the expected type, validation failed.")
      obj.participant_left_timeout&.is_a?(Float) != false || raise("Passed value for field obj.participant_left_timeout is not the expected type, validation failed.")
      obj.participant_absent_timeout&.is_a?(Float) != false || raise("Passed value for field obj.participant_absent_timeout is not the expected type, validation failed.")
      obj.enable_recording&.is_a?(Boolean) != false || raise("Passed value for field obj.enable_recording is not the expected type, validation failed.")
      obj.enable_transcription&.is_a?(Boolean) != false || raise("Passed value for field obj.enable_transcription is not the expected type, validation failed.")
      obj.apply_greenscreen&.is_a?(Boolean) != false || raise("Passed value for field obj.apply_greenscreen is not the expected type, validation failed.")
      obj.language&.is_a?(String) != false || raise("Passed value for field obj.language is not the expected type, validation failed.")
      obj.recording_s_3_bucket_name&.is_a?(String) != false || raise("Passed value for field obj.recording_s_3_bucket_name is not the expected type, validation failed.")
      obj.recording_s_3_bucket_region&.is_a?(String) != false || raise("Passed value for field obj.recording_s_3_bucket_region is not the expected type, validation failed.")
      obj.aws_assume_role_arn&.is_a?(String) != false || raise("Passed value for field obj.aws_assume_role_arn is not the expected type, validation failed.")
    end
  end
end