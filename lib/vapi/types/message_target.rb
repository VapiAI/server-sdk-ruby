# frozen_string_literal: true

module Vapi
  module Types
    class MessageTarget < Internal::Types::Model
      field :role, -> { Vapi::Types::MessageTargetRole }, optional: true, nullable: false
      field :position, -> { Integer }, optional: true, nullable: false
    end
  end
end
