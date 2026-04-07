# frozen_string_literal: true

module Vapi
  module Types
    class ResponseErrorEvent < Internal::Types::Model
      field :type, -> { Vapi::Types::ResponseErrorEventType }, optional: false, nullable: false
      field :code, -> { String }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
      field :param, -> { String }, optional: true, nullable: false
      field :sequence_number, -> { Integer }, optional: false, nullable: false
    end
  end
end
