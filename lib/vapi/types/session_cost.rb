# frozen_string_literal: true

module Vapi
  module Types
    class SessionCost < Internal::Types::Model
      field :cost, -> { Integer }, optional: false, nullable: false
    end
  end
end
