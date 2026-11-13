# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardAffectedCallDto < Internal::Types::Model
      field :call_id, -> { String }, optional: false, nullable: false, api_name: "callId"
      field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
      field :call_time, -> { String }, optional: false, nullable: false, api_name: "callTime"
      field :call_availability, -> { Vapi::Types::CallHealthDashboardAffectedCallDtoCallAvailability }, optional: false, nullable: false, api_name: "callAvailability"
    end
  end
end
