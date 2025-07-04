# frozen_string_literal: true

module Vapi
  # This is the search method used when searching for relevant chunks from the
  #  vector store.
  class TrieveKnowledgeBaseSearchPlanSearchType
    FULLTEXT = "fulltext"
    SEMANTIC = "semantic"
    HYBRID = "hybrid"
    BM_25 = "bm25"
  end
end
