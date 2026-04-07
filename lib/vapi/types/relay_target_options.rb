# frozen_string_literal: true

module Vapi
  module Types
    class RelayTargetOptions < Internal::Types::Model
      field :type, -> { Vapi::Types::RelayTargetOptionsType }, optional: false, nullable: false
    end
  end
end
