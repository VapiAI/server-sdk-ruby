# frozen_string_literal: true

module Vapi
  module Types
    class SipTrunkOutboundSipRegisterPlan < Internal::Types::Model
      field :domain, -> { String }, optional: true, nullable: false
      field :username, -> { String }, optional: true, nullable: false
      field :realm, -> { String }, optional: true, nullable: false
    end
  end
end
