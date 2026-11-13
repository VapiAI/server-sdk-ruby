# frozen_string_literal: true

module Vapi
  module Types
    class TrafficTabEndedReasonCountDto < Internal::Types::Model
      field :reason, -> { String }, optional: false, nullable: false
      field :count, -> { Integer }, optional: false, nullable: false
    end
  end
end
