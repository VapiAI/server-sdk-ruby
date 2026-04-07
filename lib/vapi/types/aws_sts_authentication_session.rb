# frozen_string_literal: true

module Vapi
  module Types
    class AwsStsAuthenticationSession < Internal::Types::Model
      field :assumed_role_user, -> { Vapi::Types::AwsStsAssumeRoleUser }, optional: true, nullable: false, api_name: "assumedRoleUser"
      field :credentials, -> { Vapi::Types::AwsStsCredentials }, optional: true, nullable: false
      field :packed_policy_size, -> { Integer }, optional: true, nullable: false, api_name: "packedPolicySize"
      field :sourced_id_entity, -> { String }, optional: true, nullable: false, api_name: "sourcedIDEntity"
    end
  end
end
