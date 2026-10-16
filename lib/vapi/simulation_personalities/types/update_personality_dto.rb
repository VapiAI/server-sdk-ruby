# frozen_string_literal: true

module Vapi
  module SimulationPersonalities
    module Types
      class UpdatePersonalityDto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :assistant, -> { Vapi::Types::CreateAssistantDto }, optional: true, nullable: false
        field :path, -> { String }, optional: true, nullable: false
      end
    end
  end
end
