# frozen_string_literal: true

module Vapi
  module Types
    # A user-authored entry in the call message history, including content, timing, security-filter results, and
    # optional speaker metadata.
    class UserMessage < Internal::Types::Model
      field :role, -> { String }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
      field :time, -> { Integer }, optional: false, nullable: false
      field :end_time, -> { Integer }, optional: false, nullable: false, api_name: "endTime"
      field :seconds_from_start, -> { Integer }, optional: false, nullable: false, api_name: "secondsFromStart"
      field :duration, -> { Integer }, optional: true, nullable: false
      field :is_filtered, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isFiltered"
      field :detected_threats, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "detectedThreats"
      field :original_message, -> { String }, optional: true, nullable: false, api_name: "originalMessage"
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :speaker_label, -> { String }, optional: true, nullable: false, api_name: "speakerLabel"
    end
  end
end
