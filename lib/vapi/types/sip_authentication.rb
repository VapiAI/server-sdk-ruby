# frozen_string_literal: true

module Vapi
  module Types
    class SipAuthentication < Internal::Types::Model
      field :realm, -> { String }, optional: true, nullable: false
      field :username, -> { String }, optional: false, nullable: false
      field :password, -> { String }, optional: false, nullable: false
    end
  end
end
