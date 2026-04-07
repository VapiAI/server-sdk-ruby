# frozen_string_literal: true

module Vapi
  module Types
    class AwsiamCredentialsAuthenticationPlan < Internal::Types::Model
      field :aws_access_key_id, -> { String }, optional: false, nullable: false, api_name: "awsAccessKeyId"
      field :aws_secret_access_key, -> { String }, optional: false, nullable: false, api_name: "awsSecretAccessKey"
    end
  end
end
