# frozen_string_literal: true

module Vapi
  module Types
    class CreateToolTemplateDto < Internal::Types::Model
      field :details, -> { Vapi::Types::CreateToolTemplateDtoDetails }, optional: true, nullable: false
      field :provider_details, -> { Vapi::Types::CreateToolTemplateDtoProviderDetails }, optional: true, nullable: false, api_name: "providerDetails"
      field :metadata, -> { Vapi::Types::ToolTemplateMetadata }, optional: true, nullable: false
      field :visibility, -> { Vapi::Types::CreateToolTemplateDtoVisibility }, optional: true, nullable: false
      field :type, -> { Vapi::Types::CreateToolTemplateDtoType }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :provider, -> { Vapi::Types::CreateToolTemplateDtoProvider }, optional: true, nullable: false
    end
  end
end
