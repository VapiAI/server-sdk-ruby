# frozen_string_literal: true

module Vapi
  module Types
    class OpenAiFunction < Internal::Types::Model
      field :strict, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :name, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :parameters, -> { Vapi::Types::OpenAiFunctionParameters }, optional: true, nullable: false
    end
  end
end
