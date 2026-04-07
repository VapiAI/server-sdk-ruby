# frozen_string_literal: true

module Vapi
  module Types
    class TwilioVoicemailDetectionPlan < Internal::Types::Model
      field :provider, -> { Vapi::Types::TwilioVoicemailDetectionPlanProvider }, optional: false, nullable: false
      field :voicemail_detection_types, -> { Internal::Types::Array[Vapi::Types::TwilioVoicemailDetectionPlanVoicemailDetectionTypesItem] }, optional: true, nullable: false, api_name: "voicemailDetectionTypes"
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :machine_detection_timeout, -> { Integer }, optional: true, nullable: false, api_name: "machineDetectionTimeout"
      field :machine_detection_speech_threshold, -> { Integer }, optional: true, nullable: false, api_name: "machineDetectionSpeechThreshold"
      field :machine_detection_speech_end_threshold, -> { Integer }, optional: true, nullable: false, api_name: "machineDetectionSpeechEndThreshold"
      field :machine_detection_silence_timeout, -> { Integer }, optional: true, nullable: false, api_name: "machineDetectionSilenceTimeout"
    end
  end
end
