# frozen_string_literal: true

module Vapi
  module KnowledgeBasesV2
    module Types
      class CreateKnowledgeBaseV2Dto < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false
        field :description, -> { String }, optional: true, nullable: false
      end
    end
  end
end
