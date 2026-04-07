# frozen_string_literal: true

module Vapi
  module Types
    class TwilioTransportMessage < Internal::Types::Model
      field :twiml, -> { String }, optional: false, nullable: false
    end
  end
end
