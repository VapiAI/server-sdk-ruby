# frozen_string_literal: true

module Vapi
  module Types
    class TrieveKnowledgeBaseSearchPlan < Internal::Types::Model
      field :top_k, -> { Integer }, optional: true, nullable: false, api_name: "topK"
      field :remove_stop_words, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "removeStopWords"
      field :score_threshold, -> { Integer }, optional: true, nullable: false, api_name: "scoreThreshold"
      field :search_type, -> { Vapi::Types::TrieveKnowledgeBaseSearchPlanSearchType }, optional: false, nullable: false, api_name: "searchType"
    end
  end
end
