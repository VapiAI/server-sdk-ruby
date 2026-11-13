# frozen_string_literal: true

module Vapi
  module Types
    class BackgroundSoundUrlValidationResult < Internal::Types::Model
      field :valid, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :reason, -> { Vapi::Types::BackgroundSoundUrlValidationResultReason }, optional: true, nullable: false
      field :status, -> { Integer }, optional: true, nullable: false
      field :content_type, -> { String }, optional: true, nullable: false, api_name: "contentType"
    end
  end
end
