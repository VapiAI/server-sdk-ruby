# frozen_string_literal: true

module Vapi
  module Types
    class VersionPinReference < Internal::Types::Model
      field :source_type, -> { Vapi::Types::VersionPinReferenceSourceType }, optional: false, nullable: false, api_name: "sourceType"
      field :source_id, -> { String }, optional: false, nullable: false, api_name: "sourceId"
    end
  end
end
