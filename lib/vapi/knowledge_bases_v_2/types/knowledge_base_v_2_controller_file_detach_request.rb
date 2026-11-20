# frozen_string_literal: true

module Vapi
  module KnowledgeBasesV2
    module Types
      class KnowledgeBaseV2ControllerFileDetachRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :file_id, -> { String }, optional: false, nullable: false, api_name: "fileId"
      end
    end
  end
end
