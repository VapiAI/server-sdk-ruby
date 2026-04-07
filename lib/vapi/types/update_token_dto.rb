# frozen_string_literal: true

module Vapi
  module Types
    class UpdateTokenDto < Internal::Types::Model
      field :tag, -> { Vapi::Types::UpdateTokenDtoTag }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :restrictions, -> { Vapi::Types::TokenRestrictions }, optional: true, nullable: false
    end
  end
end
