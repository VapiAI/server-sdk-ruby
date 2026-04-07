# frozen_string_literal: true

module Vapi
  module Types
    class UpdatePersonalityDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
      field :path, -> { String }, optional: true, nullable: false
    end
  end
end
