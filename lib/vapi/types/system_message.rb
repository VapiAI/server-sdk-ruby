# frozen_string_literal: true

module Vapi
  module Types
    class SystemMessage < Internal::Types::Model
      field :role, -> { String }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
      field :time, -> { Integer }, optional: false, nullable: false
      field :seconds_from_start, -> { Integer }, optional: false, nullable: false, api_name: "secondsFromStart"
    end
  end
end
