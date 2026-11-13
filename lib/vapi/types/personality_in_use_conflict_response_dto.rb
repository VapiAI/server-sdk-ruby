# frozen_string_literal: true

module Vapi
  module Types
    class PersonalityInUseConflictResponseDto < Internal::Types::Model
      field :error, -> { Vapi::Types::PersonalityInUseConflictResponseDtoError }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
    end
  end
end
