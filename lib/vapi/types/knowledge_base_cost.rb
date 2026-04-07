# frozen_string_literal: true

module Vapi
  module Types
    class KnowledgeBaseCost < Internal::Types::Model
      field :model, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :prompt_tokens, -> { Integer }, optional: false, nullable: false, api_name: "promptTokens"
      field :completion_tokens, -> { Integer }, optional: false, nullable: false, api_name: "completionTokens"
      field :cost, -> { Integer }, optional: false, nullable: false
    end
  end
end
