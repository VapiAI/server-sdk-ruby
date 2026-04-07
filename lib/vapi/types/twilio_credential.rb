# frozen_string_literal: true

module Vapi
  module Types
    class TwilioCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::TwilioCredentialProvider }, optional: false, nullable: false
      field :auth_token, -> { String }, optional: true, nullable: false, api_name: "authToken"
      field :api_key, -> { String }, optional: true, nullable: false, api_name: "apiKey"
      field :api_secret, -> { String }, optional: true, nullable: false, api_name: "apiSecret"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
      field :account_sid, -> { String }, optional: false, nullable: false, api_name: "accountSid"
    end
  end
end
