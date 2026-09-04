# frozen_string_literal: true

module Vapi
  module Types
    # Controls whether the call transcript is stored and the speaker names used in the transcript.
    class TranscriptPlan < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :assistant_name, -> { String }, optional: true, nullable: false, api_name: "assistantName"
      field :user_name, -> { String }, optional: true, nullable: false, api_name: "userName"
    end
  end
end
