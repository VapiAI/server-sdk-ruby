# frozen_string_literal: true

module Vapi
  module Types
    class VoiceLibrary < Internal::Types::Model
      field :provider, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :provider_id, -> { String }, optional: true, nullable: false, api_name: "providerId"
      field :slug, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :language, -> { String }, optional: true, nullable: false
      field :language_code, -> { String }, optional: true, nullable: false, api_name: "languageCode"
      field :model, -> { String }, optional: true, nullable: false
      field :supported_models, -> { String }, optional: true, nullable: false, api_name: "supportedModels"
      field :gender, -> { Vapi::Types::VoiceLibraryGender }, optional: true, nullable: false
      field :accent, -> { String }, optional: true, nullable: false
      field :preview_url, -> { String }, optional: true, nullable: false, api_name: "previewUrl"
      field :sort_order, -> { Integer }, optional: true, nullable: false, api_name: "sortOrder"
      field :description, -> { String }, optional: true, nullable: false
      field :credential_id, -> { String }, optional: true, nullable: false, api_name: "credentialId"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :is_public, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isPublic"
      field :is_deleted, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isDeleted"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
