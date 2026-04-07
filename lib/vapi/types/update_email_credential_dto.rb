# frozen_string_literal: true

module Vapi
  module Types
    class UpdateEmailCredentialDto < Internal::Types::Model
      field :email, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
