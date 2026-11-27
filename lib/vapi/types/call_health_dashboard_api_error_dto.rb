# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardApiErrorDto < Internal::Types::Model
      field :code, -> { String }, optional: false, nullable: false
      field :message, -> { String }, optional: false, nullable: false
      field :request_id, -> { String }, optional: false, nullable: false, api_name: "requestId"
      field :retryable, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
