# frozen_string_literal: true

module Vapi
  module Types
    class OpenAiMessage < Internal::Types::Model
      field :content, -> { String }, optional: false, nullable: true
      field :role, -> { Vapi::Types::OpenAiMessageRole }, optional: false, nullable: false
    end
  end
end
