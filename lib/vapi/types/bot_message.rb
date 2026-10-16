# frozen_string_literal: true

module Vapi
  module Types
    # An assistant-authored entry in the call message history, including content, timing, source, and duration.
    class BotMessage < Internal::Types::Model
      field :role, -> { String }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
      field :time, -> { Integer }, optional: false, nullable: false
      field :end_time, -> { Integer }, optional: false, nullable: false, api_name: "endTime"
      field :seconds_from_start, -> { Integer }, optional: false, nullable: false, api_name: "secondsFromStart"
      field :source, -> { String }, optional: true, nullable: false
      field :duration, -> { Integer }, optional: true, nullable: false
      field :assistant_name, -> { String }, optional: true, nullable: false, api_name: "assistantName"
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
    end
  end
end
