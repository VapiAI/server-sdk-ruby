# frozen_string_literal: true

module Vapi
  module Types
    class EvalModelListOptions < Internal::Types::Model
      field :provider, -> { Vapi::Types::EvalModelListOptionsProvider }, optional: false, nullable: false
    end
  end
end
