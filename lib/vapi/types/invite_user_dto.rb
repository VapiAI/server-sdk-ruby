# frozen_string_literal: true

module Vapi
  module Types
    class InviteUserDto < Internal::Types::Model
      field :emails, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      field :role, -> { Vapi::Types::InviteUserDtoRole }, optional: false, nullable: false
      field :redirect_to, -> { String }, optional: true, nullable: false, api_name: "redirectTo"
    end
  end
end
