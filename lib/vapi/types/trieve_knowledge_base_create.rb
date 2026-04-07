# frozen_string_literal: true

module Vapi
  module Types
    class TrieveKnowledgeBaseCreate < Internal::Types::Model
      field :type, -> { Vapi::Types::TrieveKnowledgeBaseCreateType }, optional: false, nullable: false
      field :chunk_plans, -> { Internal::Types::Array[Vapi::Types::TrieveKnowledgeBaseChunkPlan] }, optional: false, nullable: false, api_name: "chunkPlans"
    end
  end
end
