# frozen_string_literal: true

module Vapi
  module Types
    class ResponseCompletedEvent < Internal::Types::Model
      field :response, -> { Vapi::Types::ResponseObject }, optional: false, nullable: false
      field :type, -> { Vapi::Types::ResponseCompletedEventType }, optional: false, nullable: false
    end
  end
end
