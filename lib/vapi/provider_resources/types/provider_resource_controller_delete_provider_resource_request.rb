# frozen_string_literal: true

module Vapi
  module ProviderResources
    module Types
      class ProviderResourceControllerDeleteProviderResourceRequest < Internal::Types::Model
        field :provider, -> { Vapi::ProviderResources::Types::ProviderResourceControllerDeleteProviderResourceRequestProvider }, optional: false, nullable: false
        field :resource_name, -> { Vapi::ProviderResources::Types::ProviderResourceControllerDeleteProviderResourceRequestResourceName }, optional: false, nullable: false, api_name: "resourceName"
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
