# frozen_string_literal: true

module Vapi
  module Types
    class CloneVoiceDto < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :labels, -> { String }, optional: true, nullable: false
      field :files, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
