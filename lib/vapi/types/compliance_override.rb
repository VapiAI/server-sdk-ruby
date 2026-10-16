# frozen_string_literal: true

module Vapi
  module Types
    # Overrides storage behavior for an output when HIPAA compliance is enabled.
    class ComplianceOverride < Internal::Types::Model
      field :force_store_on_hipaa_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "forceStoreOnHipaaEnabled"
    end
  end
end
