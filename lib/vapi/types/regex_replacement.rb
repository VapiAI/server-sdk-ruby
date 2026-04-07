# frozen_string_literal: true

module Vapi
  module Types
    class RegexReplacement < Internal::Types::Model
      field :regex, -> { String }, optional: false, nullable: false
      field :options, -> { Internal::Types::Array[Vapi::Types::RegexOption] }, optional: true, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
