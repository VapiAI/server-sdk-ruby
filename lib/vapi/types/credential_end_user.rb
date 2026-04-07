# frozen_string_literal: true

module Vapi
  module Types
    class CredentialEndUser < Internal::Types::Model
      field :end_user_email, -> { String }, optional: true, nullable: false, api_name: "endUserEmail"
      field :end_user_id, -> { String }, optional: false, nullable: false, api_name: "endUserId"
      field :organization_id, -> { String }, optional: false, nullable: false, api_name: "organizationId"
      field :tags, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
