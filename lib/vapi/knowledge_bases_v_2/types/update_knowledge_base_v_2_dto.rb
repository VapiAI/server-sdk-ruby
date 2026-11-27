# frozen_string_literal: true

module Vapi
  module KnowledgeBasesV2
    module Types
      class UpdateKnowledgeBaseV2Dto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :description, -> { String }, optional: true, nullable: false
      end
    end
  end
end
