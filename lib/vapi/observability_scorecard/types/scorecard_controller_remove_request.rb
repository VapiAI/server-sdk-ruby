# frozen_string_literal: true

module Vapi
  module ObservabilityScorecard
    module Types
      class ScorecardControllerRemoveRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
