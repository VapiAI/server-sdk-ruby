# frozen_string_literal: true

module Vapi
  module Types
    class MonitorPlan < Internal::Types::Model
      field :listen_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "listenEnabled"
      field :listen_authentication_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "listenAuthenticationEnabled"
      field :control_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "controlEnabled"
      field :control_authentication_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "controlAuthenticationEnabled"
      field :monitor_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "monitorIds"
    end
  end
end
