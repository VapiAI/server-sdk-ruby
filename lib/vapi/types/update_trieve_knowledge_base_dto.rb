# frozen_string_literal: true

module Vapi
  module Types
    class UpdateTrieveKnowledgeBaseDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :search_plan, -> { Vapi::Types::TrieveKnowledgeBaseSearchPlan }, optional: true, nullable: false, api_name: "searchPlan"
      field :create_plan, -> { Vapi::Types::TrieveKnowledgeBaseImport }, optional: true, nullable: false, api_name: "createPlan"
    end
  end
end
