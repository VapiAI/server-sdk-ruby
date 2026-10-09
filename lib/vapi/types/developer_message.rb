# frozen_string_literal: true

module Vapi
  module Types
    # A developer-authored instruction message supplied to the language model.
    class DeveloperMessage < Internal::Types::Model
      field :role, -> { Vapi::Types::DeveloperMessageRole }, optional: false, nullable: false
      field :content, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
