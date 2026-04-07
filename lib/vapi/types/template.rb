# frozen_string_literal: true

module Vapi
  module Types
    class Template < Internal::Types::Model
      field :details, -> { Vapi::Types::TemplateDetails }, optional: true, nullable: false
      field :provider_details, -> { Vapi::Types::TemplateProviderDetails }, optional: true, nullable: false, api_name: "providerDetails"
      field :metadata, -> { Vapi::Types::ToolTemplateMetadata }, optional: true, nullable: false
      field :visibility, -> { Vapi::Types::TemplateVisibility }, optional: true, nullable: false
      field :type, -> { Vapi::Types::TemplateType }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :provider, -> { Vapi::Types::TemplateProvider }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
