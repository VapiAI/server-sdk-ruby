# frozen_string_literal: true

module Vapi
  module Types
    # Selects a conversation message by participant role and position for condition evaluation.
    class MessageTarget < Internal::Types::Model
      field :role, -> { Vapi::Types::MessageTargetRole }, optional: true, nullable: false
      field :position, -> { Integer }, optional: true, nullable: false
    end
  end
end
