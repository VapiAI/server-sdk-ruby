# frozen_string_literal: true

module Vapi
  module Types
    # Credentials for authenticating knowledge-base requests with Trieve.
    class CreateTrieveCredentialDto < Internal::Types::Model
      field :provider, -> { Object }, optional: true, nullable: false
    end
  end
end
