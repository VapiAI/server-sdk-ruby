# frozen_string_literal: true

module Vapi
  module Types
    # A knowledge-base configuration, including its provider, model, description, and associated files.
    class KnowledgeBase < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :provider, -> { Vapi::Types::KnowledgeBaseProvider }, optional: false, nullable: false
      field :model, -> { Vapi::Types::KnowledgeBaseModel }, optional: true, nullable: false
      field :description, -> { String }, optional: false, nullable: false
      field :file_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "fileIds"
    end
  end
end
