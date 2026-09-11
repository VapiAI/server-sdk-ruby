# frozen_string_literal: true

module Vapi
  module Types
    class UpdateToolVersionMetadataDto < Internal::Types::Model
      field :version_name, -> { String }, optional: true, nullable: false, api_name: "versionName"
      field :version_description, -> { String }, optional: true, nullable: false, api_name: "versionDescription"
    end
  end
end
