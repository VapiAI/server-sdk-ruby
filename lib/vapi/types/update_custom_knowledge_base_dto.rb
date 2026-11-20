# frozen_string_literal: true

module Vapi
  module Types
    class UpdateCustomKnowledgeBaseDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::UpdateCustomKnowledgeBaseDtoProvider }, optional: true, nullable: false
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
    end
  end
end
