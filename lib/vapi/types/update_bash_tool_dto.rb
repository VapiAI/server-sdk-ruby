# frozen_string_literal: true

module Vapi
  module Types
    # Fields used to update a Bash tool, including its name, environment subtype, server, messages, and rejection plan.
    class UpdateBashToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::UpdateBashToolDtoMessagesItem] }, optional: true, nullable: false
      field :sub_type, -> { Vapi::Types::UpdateBashToolDtoSubType }, optional: true, nullable: false, api_name: "subType"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
      field :name, -> { Vapi::Types::UpdateBashToolDtoName }, optional: true, nullable: false
    end
  end
end
