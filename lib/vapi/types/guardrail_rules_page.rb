# frozen_string_literal: true

module Vapi
  module Types
    class GuardrailRulesPage < Internal::Types::Model
      field :results, -> { Internal::Types::Array[Vapi::Types::GuardrailRule] }, optional: false, nullable: false
      field :metadata, -> { Vapi::Types::PaginationMeta }, optional: false, nullable: false
    end
  end
end
