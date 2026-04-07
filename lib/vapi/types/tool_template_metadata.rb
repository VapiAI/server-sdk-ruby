# frozen_string_literal: true

module Vapi
  module Types
    class ToolTemplateMetadata < Internal::Types::Model
      field :collection_type, -> { String }, optional: true, nullable: false, api_name: "collectionType"
      field :collection_id, -> { String }, optional: true, nullable: false, api_name: "collectionId"
      field :collection_name, -> { String }, optional: true, nullable: false, api_name: "collectionName"
    end
  end
end
