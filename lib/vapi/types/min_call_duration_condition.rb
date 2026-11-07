# frozen_string_literal: true

module Vapi
  module Types
    class MinCallDurationCondition < Internal::Types::Model
      field :seconds, -> { Integer }, optional: false, nullable: false
    end
  end
end
