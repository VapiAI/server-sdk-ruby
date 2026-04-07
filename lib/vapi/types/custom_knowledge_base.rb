# frozen_string_literal: true

module Vapi
  module Types
    class CustomKnowledgeBase < Internal::Types::Model
      field :provider, -> { Vapi::Types::CustomKnowledgeBaseProvider }, optional: false, nullable: false
      field :server, -> { Vapi::Types::Server }, optional: false, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
    end
  end
end
