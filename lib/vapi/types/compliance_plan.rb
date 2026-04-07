# frozen_string_literal: true

module Vapi
  module Types
    class CompliancePlan < Internal::Types::Model
      field :hipaa_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hipaaEnabled"
      field :pci_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "pciEnabled"
      field :security_filter_plan, -> { Vapi::Types::SecurityFilterPlan }, optional: true, nullable: false, api_name: "securityFilterPlan"
      field :recording_consent_plan, -> { Vapi::Types::CompliancePlanRecordingConsentPlan }, optional: true, nullable: false, api_name: "recordingConsentPlan"
    end
  end
end
