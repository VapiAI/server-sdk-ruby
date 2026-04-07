# frozen_string_literal: true

module Vapi
  module Types
    class SlackWebhookCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::SlackWebhookCredentialProvider }, optional: false, nullable: false
      field :webhook_url, -> { String }, optional: false, nullable: false, api_name: "webhookUrl"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
