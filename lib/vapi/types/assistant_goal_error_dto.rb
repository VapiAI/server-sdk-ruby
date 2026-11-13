# frozen_string_literal: true

module Vapi
  module Types
    class AssistantGoalErrorDto < Internal::Types::Model
      field :status_code, -> { Integer }, optional: false, nullable: false, api_name: "statusCode"
      field :error, -> { String }, optional: true, nullable: false
      field :message, -> { Vapi::Types::AssistantGoalErrorDtoMessage }, optional: false, nullable: false
    end
  end
end
