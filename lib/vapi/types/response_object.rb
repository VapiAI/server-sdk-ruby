# frozen_string_literal: true

module Vapi
  module Types
    class ResponseObject < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :object, -> { Vapi::Types::ResponseObjectObject }, optional: false, nullable: false
      field :created_at, -> { Integer }, optional: false, nullable: false
      field :status, -> { Vapi::Types::ResponseObjectStatus }, optional: false, nullable: false
      field :error, -> { String }, optional: true, nullable: false
      field :output, -> { Internal::Types::Array[Vapi::Types::ResponseOutputMessage] }, optional: false, nullable: false
    end
  end
end
