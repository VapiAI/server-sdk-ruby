# frozen_string_literal: true

module Vapi
  module Types
    class ChatCost < Internal::Types::Model
      field :cost, -> { Integer }, optional: false, nullable: false
    end
  end
end
