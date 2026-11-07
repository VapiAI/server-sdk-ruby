# frozen_string_literal: true

module Vapi
  module Types
    # OAuth 2.0 session credentials for authenticating GoHighLevel MCP requests.
    class CreateGoHighLevelMcpCredentialDto < Internal::Types::Model
      field :authentication_session, -> { Vapi::Types::Oauth2AuthenticationSession }, optional: false, nullable: false, api_name: "authenticationSession"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
