# frozen_string_literal: true

module Vapi
  module Types
    # Filters transcript content that matches a custom regular expression.
    class RegexSecurityFilter < Internal::Types::Model
      field :type, -> { Vapi::Types::RegexSecurityFilterType }, optional: false, nullable: false
      field :regex, -> { String }, optional: false, nullable: false
    end
  end
end
