# frozen_string_literal: true

module Vapi
  module Types
    class CredentialSessionResponse < Internal::Types::Model
      field :session_token, -> { String }, optional: false, nullable: false, api_name: "sessionToken"
    end
  end
end
