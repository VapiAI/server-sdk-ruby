# frozen_string_literal: true

module Vapi
  module Types
    class LangfuseServerProbeResponse < Internal::Types::Model
      field :reachable, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :server_version, -> { String }, optional: true, nullable: false, api_name: "serverVersion"
      field :blocked_message, -> { String }, optional: true, nullable: false, api_name: "blockedMessage"
    end
  end
end
