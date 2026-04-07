# frozen_string_literal: true

module Vapi
  module Types
    class KnowledgeBaseResponseDocument < Internal::Types::Model
      field :content, -> { String }, optional: false, nullable: false
      field :similarity, -> { Integer }, optional: false, nullable: false
      field :uuid, -> { String }, optional: true, nullable: false
    end
  end
end
