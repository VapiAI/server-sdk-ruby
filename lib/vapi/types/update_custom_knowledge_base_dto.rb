# frozen_string_literal: true

module Vapi
  module Types
    class UpdateCustomKnowledgeBaseDto < Internal::Types::Model
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
    end
  end
end
