# frozen_string_literal: true

module Vapi
  module Types
    class UpdateVoiceLibraryMetadataDto < Internal::Types::Model
      field :name, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
