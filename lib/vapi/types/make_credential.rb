# frozen_string_literal: true

module Vapi
  module Types
    class MakeCredential < Internal::Types::Model
      field :provider, -> { Vapi::Types::MakeCredentialProvider }, optional: false, nullable: false
      field :team_id, -> { String }, optional: false, nullable: false, api_name: "teamId"
      field :region, -> { String }, optional: false, nullable: false
      field :api_key, -> { String }, optional: false, nullable: false, api_name: "apiKey"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :name, -> { String }, optional: true, nullable: false
    end
  end
end
