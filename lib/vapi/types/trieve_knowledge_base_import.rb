# frozen_string_literal: true

module Vapi
  module Types
    class TrieveKnowledgeBaseImport < Internal::Types::Model
      field :type, -> { Vapi::Types::TrieveKnowledgeBaseImportType }, optional: false, nullable: false
      field :provider_id, -> { String }, optional: false, nullable: false, api_name: "providerId"
    end
  end
end
