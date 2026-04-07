# frozen_string_literal: true

module Vapi
  module Types
    # Authentication method - either direct IAM credentials or cross-account role assumption.
    class UpdateAnthropicBedrockCredentialDtoAuthenticationPlan < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::AwsiamCredentialsAuthenticationPlan }, key: "AWS_IAM"
      member -> { Vapi::Types::AwsStsAuthenticationPlan }, key: "AWS_STS"
    end
  end
end
