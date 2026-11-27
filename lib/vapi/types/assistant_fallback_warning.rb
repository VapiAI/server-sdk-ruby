# frozen_string_literal: true

module Vapi
  module Types
    class AssistantFallbackWarning < Internal::Types::Model
      field :code, -> { Vapi::Types::AssistantFallbackWarningCode }, optional: false, nullable: false
      field :slot, -> { String }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
    end
  end
end
