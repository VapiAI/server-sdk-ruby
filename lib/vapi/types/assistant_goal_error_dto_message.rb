# frozen_string_literal: true

module Vapi
  module Types
    class AssistantGoalErrorDtoMessage < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { String }
      member -> { Internal::Types::Array[String] }
    end
  end
end
