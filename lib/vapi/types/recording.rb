# frozen_string_literal: true

module Vapi
  module Types
    class Recording < Internal::Types::Model
      field :stereo_url, -> { String }, optional: true, nullable: false, api_name: "stereoUrl"
      field :video_url, -> { String }, optional: true, nullable: false, api_name: "videoUrl"
      field :video_recording_start_delay_seconds, -> { Integer }, optional: true, nullable: false, api_name: "videoRecordingStartDelaySeconds"
      field :mono, -> { Vapi::Types::Mono }, optional: true, nullable: false
    end
  end
end
