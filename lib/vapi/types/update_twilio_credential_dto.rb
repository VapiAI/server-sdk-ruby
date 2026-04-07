# frozen_string_literal: true

module Vapi
  module Types
    class UpdateTwilioCredentialDto < Internal::Types::Model
      field :auth_token, -> { String }, optional: true, nullable: false, api_name: "authToken"
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :api_secret, -> { String }, optional: true, nullable: false, api_name: "apiSecret"
      field :name, -> { String }, optional: true, nullable: false
      field :account_sid, -> { String }, optional: true, nullable: false, api_name: "accountSid"
    end
  end
end
