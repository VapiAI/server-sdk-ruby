# frozen_string_literal: true

module Vapi
  module Types
    class VapiVoiceCloneDto < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :language, -> { String }, optional: true, nullable: false
      field :files, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
