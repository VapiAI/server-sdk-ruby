# frozen_string_literal: true

module Vapi
  module Types
    # Replaces text matching a regular expression before it is sent to a voice provider.
    class RegexReplacement < Internal::Types::Model
      field :regex, -> { String }, optional: false, nullable: false
      field :options, -> { Internal::Types::Array[Vapi::Types::RegexOption] }, optional: true, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
