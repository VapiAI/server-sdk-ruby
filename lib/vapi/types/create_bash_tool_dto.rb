# frozen_string_literal: true

module Vapi
  module Types
    class CreateBashToolDto < Internal::Types::Model
      field :messages, -> { Internal::Types::Array[Vapi::Types::CreateBashToolDtoMessagesItem] }, optional: true, nullable: false
      field :sub_type, -> { Vapi::Types::CreateBashToolDtoSubType }, optional: false, nullable: false, api_name: "subType"
      field :server, -> { Vapi::Types::Server }, optional: true, nullable: false
      field :name, -> { Vapi::Types::CreateBashToolDtoName }, optional: false, nullable: false
      field :rejection_plan, -> { Vapi::Types::ToolRejectionPlan }, optional: true, nullable: false, api_name: "rejectionPlan"
    end
  end
end
