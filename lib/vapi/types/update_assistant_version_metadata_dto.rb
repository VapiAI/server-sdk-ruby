# frozen_string_literal: true

module Vapi
  module Types
    class UpdateAssistantVersionMetadataDto < Internal::Types::Model
      field :version_name, -> { String }, optional: true, nullable: false, api_name: "versionName"
      field :version_description, -> { String }, optional: true, nullable: false, api_name: "versionDescription"
    end
  end
end
