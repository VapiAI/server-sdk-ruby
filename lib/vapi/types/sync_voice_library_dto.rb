# frozen_string_literal: true

module Vapi
  module Types
    class SyncVoiceLibraryDto < Internal::Types::Model
      field :providers, -> { Internal::Types::Array[Vapi::Types::SyncVoiceLibraryDtoProvidersItem] }, optional: true, nullable: false
    end
  end
end
