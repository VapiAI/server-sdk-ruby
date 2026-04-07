# frozen_string_literal: true

module Vapi
  module Types
    class AwsStsAssumeRoleUser < Internal::Types::Model
      field :assumed_role_id, -> { String }, optional: true, nullable: false, api_name: "AssumedRoleId"
      field :arn, -> { String }, optional: true, nullable: false, api_name: "Arn"
    end
  end
end
