# frozen_string_literal: true

module Vapi
  module Types
    class CreateEmailCredentialDto < Internal::Types::Model
      field :email, -> { String }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
