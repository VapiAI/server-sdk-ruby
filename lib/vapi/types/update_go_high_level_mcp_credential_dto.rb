# frozen_string_literal: true

module Vapi
  module Types
    class UpdateGoHighLevelMcpCredentialDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::UpdateGoHighLevelMcpCredentialDtoProvider }, optional: true, nullable: false
      field :authentication_session, -> { Vapi::Types::Oauth2AuthenticationSession }, optional: true, nullable: false, api_name: "authenticationSession"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
