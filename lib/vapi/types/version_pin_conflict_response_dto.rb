# frozen_string_literal: true

module Vapi
  module Types
    class VersionPinConflictResponseDto < Internal::Types::Model
      field :error, -> { Vapi::Types::VersionPinConflictResponseDtoError }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
      field :pinned_by, -> { Internal::Types::Array[Vapi::Types::VersionPinReference] }, optional: false, nullable: false, api_name: "pinnedBy"
    end
  end
end
