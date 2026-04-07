# frozen_string_literal: true

module Vapi
  module Types
    class RelayCommandOptions < Internal::Types::Model
      field :type, -> { Vapi::Types::RelayCommandOptionsType }, optional: false, nullable: false
    end
  end
end
