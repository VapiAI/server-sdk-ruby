# frozen_string_literal: true

module Vapi
  module Types
    class BotMessage < Internal::Types::Model
      field :role, -> { String }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
      field :time, -> { Integer }, optional: false, nullable: false
      field :end_time, -> { Integer }, optional: false, nullable: false, api_name: "endTime"
      field :seconds_from_start, -> { Integer }, optional: false, nullable: false, api_name: "secondsFromStart"
      field :source, -> { String }, optional: true, nullable: false
      field :duration, -> { Integer }, optional: true, nullable: false
    end
  end
end
