# frozen_string_literal: true

module Vapi
  module Types
    class UpdateEmailCredentialDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::UpdateEmailCredentialDtoProvider }, optional: true, nullable: false
      field :email, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
