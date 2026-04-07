# frozen_string_literal: true

module Vapi
  module Types
    class TranscriptPlan < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :assistant_name, -> { String }, optional: true, nullable: false, api_name: "assistantName"
      field :user_name, -> { String }, optional: true, nullable: false, api_name: "userName"
    end
  end
end
