# frozen_string_literal: true

module Vapi
  module Types
    class TrieveKnowledgeBaseChunkPlan < Internal::Types::Model
      field :file_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "fileIds"
      field :websites, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :target_splits_per_chunk, -> { Integer }, optional: true, nullable: false, api_name: "targetSplitsPerChunk"
      field :split_delimiters, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "splitDelimiters"
      field :rebalance_chunks, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "rebalanceChunks"
    end
  end
end
