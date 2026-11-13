# frozen_string_literal: true

module Vapi
  module Types
    class KnowledgeBaseToolFunction < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :strict, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :description, -> { String }, optional: false, nullable: false
      field :parameters, -> { Vapi::Types::OpenAiFunctionParameters }, optional: false, nullable: false
    end
  end
end
