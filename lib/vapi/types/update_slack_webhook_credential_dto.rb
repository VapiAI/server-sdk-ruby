# frozen_string_literal: true

module Vapi
  module Types
    class UpdateSlackWebhookCredentialDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::UpdateSlackWebhookCredentialDtoProvider }, optional: true, nullable: false
      field :webhook_url, -> { String }, optional: true, nullable: false, api_name: "webhookUrl"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
