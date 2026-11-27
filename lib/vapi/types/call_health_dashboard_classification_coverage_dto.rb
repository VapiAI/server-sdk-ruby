# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardClassificationCoverageDto < Internal::Types::Model
      field :pending, -> { Integer }, optional: false, nullable: false
      field :unavailable, -> { Integer }, optional: false, nullable: false
      field :skipped, -> { Integer }, optional: false, nullable: false
      field :error, -> { Integer }, optional: false, nullable: false
      field :excluded, -> { Integer }, optional: false, nullable: false
      field :complete, -> { Integer }, optional: false, nullable: false
      field :partial, -> { Integer }, optional: false, nullable: false
    end
  end
end
