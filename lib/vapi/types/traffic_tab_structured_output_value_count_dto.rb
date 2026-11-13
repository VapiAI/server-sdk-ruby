# frozen_string_literal: true

module Vapi
  module Types
    class TrafficTabStructuredOutputValueCountDto < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false
      field :count, -> { Integer }, optional: false, nullable: false
    end
  end
end
