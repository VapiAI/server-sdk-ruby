# frozen_string_literal: true

module Vapi
  module Types
    class SqlInjectionSecurityFilter < Internal::Types::Model
      field :type, -> { Vapi::Types::SqlInjectionSecurityFilterType }, optional: false, nullable: false
    end
  end
end
