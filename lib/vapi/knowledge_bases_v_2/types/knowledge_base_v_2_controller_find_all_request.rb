# frozen_string_literal: true

module Vapi
  module KnowledgeBasesV2
    module Types
      class KnowledgeBaseV2ControllerFindAllRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
