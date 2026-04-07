# frozen_string_literal: true

module Vapi
  module Types
    class UpdateToolTemplateDto < Internal::Types::Model
      field :details, -> { Vapi::Types::UpdateToolTemplateDtoDetails }, optional: true, nullable: false
      field :provider_details, -> { Vapi::Types::UpdateToolTemplateDtoProviderDetails }, optional: true, nullable: false, api_name: "providerDetails"
      field :metadata, -> { Vapi::Types::ToolTemplateMetadata }, optional: true, nullable: false
      field :visibility, -> { Vapi::Types::UpdateToolTemplateDtoVisibility }, optional: true, nullable: false
      field :type, -> { Vapi::Types::UpdateToolTemplateDtoType }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :provider, -> { Vapi::Types::UpdateToolTemplateDtoProvider }, optional: true, nullable: false
    end
  end
end
