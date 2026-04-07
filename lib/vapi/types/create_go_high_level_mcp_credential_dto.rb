# frozen_string_literal: true

module Vapi
  module Types
    class CreateGoHighLevelMcpCredentialDto < Internal::Types::Model
      field :authentication_session, -> { Vapi::Types::Oauth2AuthenticationSession }, optional: false, nullable: false, api_name: "authenticationSession"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
