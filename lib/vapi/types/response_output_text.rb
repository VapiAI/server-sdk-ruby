# frozen_string_literal: true

module Vapi
  module Types
    class ResponseOutputText < Internal::Types::Model
      field :annotations, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: false, nullable: false
      field :text, -> { String }, optional: false, nullable: false
      field :type, -> { Vapi::Types::ResponseOutputTextType }, optional: false, nullable: false
    end
  end
end
