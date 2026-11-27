# frozen_string_literal: true

module Vapi
  module Types
    class TranscriptReplay < Internal::Types::Model
      field :recording_url, -> { String }, optional: false, nullable: false, api_name: "recordingUrl"
      field :answer_key, -> { Vapi::Types::TranscriptAnswerKey }, optional: true, nullable: false, api_name: "answerKey"
      field :answer_key_url, -> { String }, optional: true, nullable: false, api_name: "answerKeyUrl"
    end
  end
end
