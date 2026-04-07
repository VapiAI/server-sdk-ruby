# frozen_string_literal: true

module Vapi
  module Types
    class AutoReloadPlan < Internal::Types::Model
      field :credits, -> { Integer }, optional: false, nullable: false
      field :threshold, -> { Integer }, optional: false, nullable: false
    end
  end
end
