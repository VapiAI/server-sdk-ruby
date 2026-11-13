# frozen_string_literal: true

module Vapi
  module Types
    class ValidateBackgroundSoundUrlDto < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false
    end
  end
end
