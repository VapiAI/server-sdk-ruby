# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardWindowDto < Internal::Types::Model
      field :call_time_gte, -> { String }, optional: false, nullable: false, api_name: "callTimeGte"
      field :call_time_lt, -> { String }, optional: false, nullable: false, api_name: "callTimeLt"
    end
  end
end
