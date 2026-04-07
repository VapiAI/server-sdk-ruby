# frozen_string_literal: true

module Vapi
  module Types
    class FallbackCustomTranscriber < Internal::Types::Model
      field :server, -> { Vapi::Types::Server }, optional: false, nullable: false
    end
  end
end
