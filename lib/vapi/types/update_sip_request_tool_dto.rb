# frozen_string_literal: true

module Vapi
  module Types
    class UpdateSipRequestToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateSipRequestToolDtoMessagesItem] }, optional: true, nullable: false
      field :verb, -> { Vapi::Types::UpdateSipRequestToolDtoVerb }, optional: true, nullable: false
      field :headers, -> { Vapi::Types::JsonSchema }, optional: true, nullable: false
      field :body, -> { Vapi::Types::UpdateSipRequestToolDtoBody }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
