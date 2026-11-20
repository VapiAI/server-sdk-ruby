# frozen_string_literal: true

module Vapi
  module Types
    # Configuration for connecting a custom knowledge-base implementation through a customer-hosted server.
    class CreateCustomKnowledgeBaseDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::CreateCustomKnowledgeBaseDtoProvider }, optional: false, nullable: false
      field :server, -> { Vapi::Types::Server }, optional: false, nullable: false
    end
  end
end
