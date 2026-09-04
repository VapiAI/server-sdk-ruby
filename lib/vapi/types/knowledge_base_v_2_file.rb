# frozen_string_literal: true

module Vapi
  module Types
    class KnowledgeBaseV2File < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :knowledge_base_v_2_id, -> { String }, optional: false, nullable: false, api_name: "knowledgeBaseV2Id"
      field :file_id, -> { String }, optional: false, nullable: false, api_name: "fileId"
      field :file_name, -> { String }, optional: true, nullable: false, api_name: "fileName"
      field :mimetype, -> { String }, optional: true, nullable: false
      field :bytes, -> { Integer }, optional: true, nullable: false
      field :status, -> { Vapi::Types::KnowledgeBaseV2FileStatus }, optional: false, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
