# frozen_string_literal: true

module Vapi
  module Types
    class CreateCustomKnowledgeBaseDto < Internal::Types::Model
      field :provider, -> { Vapi::Types::CreateCustomKnowledgeBaseDtoProvider }, optional: false, nullable: false
      field :server, -> { Vapi::Types::Server }, optional: false, nullable: false
    end
  end
end
