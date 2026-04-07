# frozen_string_literal: true

module Vapi
  module Types
    class CreateSipRequestToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateSipRequestToolDtoMessagesItem] }, optional: true, nullable: false
      field :verb, -> { Vapi::Types::CreateSipRequestToolDtoVerb }, optional: false, nullable: false
      field :headers, -> { Vapi::Types::JsonSchema }, optional: true, nullable: false
      field :body, -> { Vapi::Types::CreateSipRequestToolDtoBody }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
