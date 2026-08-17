# frozen_string_literal: true

module Vapi
  module Types
    # Speech-to-text cost for a call, including transcriber, billable minutes, and amount.
    class TranscriberCost < Internal::Types::Model
      field :transcriber, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :minutes, -> { Integer }, optional: false, nullable: false
      field :cost, -> { Integer }, optional: false, nullable: false
    end
  end
end
