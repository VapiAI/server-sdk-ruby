# frozen_string_literal: true

module Vapi
  module ProviderResources
    module Types
      class ProviderResourceControllerGetProviderResourceRequest < Internal::Types::Model
        field :provider, -> { Vapi::ProviderResources::Types::ProviderResourceControllerGetProviderResourceRequestProvider }, optional: false, nullable: false
        field :resource_name, -> { Vapi::ProviderResources::Types::ProviderResourceControllerGetProviderResourceRequestResourceName }, optional: false, nullable: false, api_name: "resourceName"
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
