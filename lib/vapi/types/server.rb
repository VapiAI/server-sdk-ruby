# frozen_string_literal: true

module Vapi
  module Types
    class Server < Internal::Types::Model
      field :timeout_seconds, -> { Integer }, optional: true, nullable: false, api_name: "timeoutSeconds"
      field :credential_id, -> { String }, optional: true, nullable: false, api_name: "credentialId"
      field :static_ip_addresses_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "staticIpAddressesEnabled"
      field :encrypted_paths, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "encryptedPaths"
      field :url, -> { String }, optional: true, nullable: false
      field :headers, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :backoff_plan, -> { Vapi::Types::BackoffPlan }, optional: true, nullable: false, api_name: "backoffPlan"
    end
  end
end
