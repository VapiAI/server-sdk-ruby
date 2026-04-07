# frozen_string_literal: true

module Vapi
  module Types
    class TavusConversationProperties < Internal::Types::Model
      field :max_call_duration, -> { Integer }, optional: true, nullable: false, api_name: "maxCallDuration"
      field :participant_left_timeout, -> { Integer }, optional: true, nullable: false, api_name: "participantLeftTimeout"
      field :participant_absent_timeout, -> { Integer }, optional: true, nullable: false, api_name: "participantAbsentTimeout"
      field :enable_recording, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "enableRecording"
      field :enable_transcription, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "enableTranscription"
      field :apply_greenscreen, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "applyGreenscreen"
      field :language, -> { String }, optional: true, nullable: false
      field :recording_s_3_bucket_name, -> { String }, optional: true, nullable: false, api_name: "recordingS3BucketName"
      field :recording_s_3_bucket_region, -> { String }, optional: true, nullable: false, api_name: "recordingS3BucketRegion"
      field :aws_assume_role_arn, -> { String }, optional: true, nullable: false, api_name: "awsAssumeRoleArn"
    end
  end
end
