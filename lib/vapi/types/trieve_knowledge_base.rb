# frozen_string_literal: true

module Vapi
  module Types
    class TrieveKnowledgeBase < Internal::Types::Model
      field :provider, -> { Vapi::Types::TrieveKnowledgeBaseProvider }, optional: false, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :search_plan, -> { Vapi::Types::TrieveKnowledgeBaseSearchPlan }, optional: true, nullable: false, api_name: "searchPlan"
      field :create_plan, -> { Vapi::Types::TrieveKnowledgeBaseImport }, optional: true, nullable: false, api_name: "createPlan"
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
    end
  end
end
