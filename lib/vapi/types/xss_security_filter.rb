# frozen_string_literal: true

module Vapi
  module Types
    class XssSecurityFilter < Internal::Types::Model
      field :type, -> { Vapi::Types::XssSecurityFilterType }, optional: false, nullable: false
    end
  end
end
