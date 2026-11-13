# frozen_string_literal: true

module Vapi
  module Types
    class GuardrailPackImpact < Internal::Types::Model
      field :assistant_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "assistantIds"
    end
  end
end
