# frozen_string_literal: true

module Vapi
  module Types
    # Voice-synthesis cost for a call, including voice, character usage, and amount.
    class VoiceCost < Internal::Types::Model
      field :voice, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :characters, -> { Integer }, optional: false, nullable: false
      field :cost, -> { Integer }, optional: false, nullable: false
    end
  end
end
