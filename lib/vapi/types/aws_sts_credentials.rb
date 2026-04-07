# frozen_string_literal: true

module Vapi
  module Types
    class AwsStsCredentials < Internal::Types::Model
      field :access_key_id, -> { String }, optional: true, nullable: false, api_name: "AccessKeyId"
      field :expiration, -> { String }, optional: true, nullable: false, api_name: "Expiration"
      field :secret_access_key, -> { String }, optional: true, nullable: false, api_name: "SecretAccessKey"
      field :session_token, -> { String }, optional: true, nullable: false, api_name: "SessionToken"
    end
  end
end
