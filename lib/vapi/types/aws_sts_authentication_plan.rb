# frozen_string_literal: true

module Vapi
  module Types
    class AwsStsAuthenticationPlan < Internal::Types::Model
      field :role_arn, -> { String }, optional: false, nullable: false, api_name: "roleArn"
      field :external_id, -> { String }, optional: true, nullable: false, api_name: "externalId"
    end
  end
end
