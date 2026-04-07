# frozen_string_literal: true

module Vapi
  module ProviderResources
    module Types
      class ProviderResourceControllerCreateProviderResourceRequest < Internal::Types::Model
        field :provider, -> { Vapi::ProviderResources::Types::ProviderResourceControllerCreateProviderResourceRequestProvider }, optional: false, nullable: false
        field :resource_name, -> { Vapi::ProviderResources::Types::ProviderResourceControllerCreateProviderResourceRequestResourceName }, optional: false, nullable: false, api_name: "resourceName"
      end
    end
  end
end
