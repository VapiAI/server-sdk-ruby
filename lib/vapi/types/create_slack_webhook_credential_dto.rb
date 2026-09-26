# frozen_string_literal: true

module Vapi
  module Types
    # Credentials for sending Vapi alerts through a Slack incoming webhook.
    class CreateSlackWebhookCredentialDto < Internal::Types::Model
      field :webhook_url, -> { String }, optional: false, nullable: false, api_name: "webhookUrl"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
