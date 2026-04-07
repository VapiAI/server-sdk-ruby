# frozen_string_literal: true

module Vapi
  module Types
    class RceSecurityFilter < Internal::Types::Model
      field :type, -> { Vapi::Types::RceSecurityFilterType }, optional: false, nullable: false
    end
  end
end
