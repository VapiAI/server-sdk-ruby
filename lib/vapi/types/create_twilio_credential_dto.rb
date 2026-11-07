# frozen_string_literal: true

module Vapi
  module Types
    # Credentials for authenticating telephony requests with Twilio using an account SID and either an auth token or API
    # key credentials.
    class CreateTwilioCredentialDto < Internal::Types::Model
      field :auth_token, -> { String }, optional: true, nullable: false, api_name: "authToken"
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :api_secret, -> { String }, optional: true, nullable: false, api_name: "apiSecret"
      field :account_sid, -> { String }, optional: false, nullable: false, api_name: "accountSid"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
