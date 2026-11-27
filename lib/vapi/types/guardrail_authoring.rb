# frozen_string_literal: true

module Vapi
  module Types
    class GuardrailAuthoring < Internal::Types::Model
      field :mode, -> { Vapi::Types::GuardrailAuthoringMode }, optional: false, nullable: false
      field :behavior, -> { String }, optional: false, nullable: false
      field :condition, -> { String }, optional: true, nullable: false
    end
  end
end
