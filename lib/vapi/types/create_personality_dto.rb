# frozen_string_literal: true

module Vapi
  module Types
    class CreatePersonalityDto < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: false, nullable: false
      field :path, -> { String }, optional: true, nullable: false
    end
  end
end
