# frozen_string_literal: true

module Vapi
  module Types
    class UpdateSlackWebhookCredentialDto < Internal::Types::Model
      field :webhook_url, -> { String }, optional: true, nullable: false, api_name: "webhookUrl"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
