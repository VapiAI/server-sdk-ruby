# frozen_string_literal: true

module Vapi
  module Types
    class CreateSlackWebhookCredentialDto < Internal::Types::Model
      field :webhook_url, -> { String }, optional: false, nullable: false, api_name: "webhookUrl"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
