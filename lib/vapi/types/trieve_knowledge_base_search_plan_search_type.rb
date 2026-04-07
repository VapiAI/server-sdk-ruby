# frozen_string_literal: true

module Vapi
  module Types
    module TrieveKnowledgeBaseSearchPlanSearchType
      extend Vapi::Internal::Types::Enum

      FULLTEXT = "fulltext"
      SEMANTIC = "semantic"
      HYBRID = "hybrid"
      BM_25 = "bm25"
    end
  end
end
