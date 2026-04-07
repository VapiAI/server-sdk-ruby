# frozen_string_literal: true

module Vapi
  module Types
    class Monitor < Internal::Types::Model
      field :monitors, -> { Internal::Types::Array[Vapi::Types::MonitorResult] }, optional: true, nullable: false
      field :listen_url, -> { String }, optional: true, nullable: false, api_name: "listenUrl"
      field :control_url, -> { String }, optional: true, nullable: false, api_name: "controlUrl"
    end
  end
end
