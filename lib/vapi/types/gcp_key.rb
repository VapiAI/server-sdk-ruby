# frozen_string_literal: true

module Vapi
  module Types
    class GcpKey < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :project_id, -> { String }, optional: false, nullable: false, api_name: "projectId"
      field :private_key_id, -> { String }, optional: false, nullable: false, api_name: "privateKeyId"
      field :private_key, -> { String }, optional: false, nullable: false, api_name: "privateKey"
      field :client_email, -> { String }, optional: false, nullable: false, api_name: "clientEmail"
      field :client_id, -> { String }, optional: false, nullable: false, api_name: "clientId"
      field :auth_uri, -> { String }, optional: false, nullable: false, api_name: "authUri"
      field :token_uri, -> { String }, optional: false, nullable: false, api_name: "tokenUri"
      field :auth_provider_x_509_cert_url, -> { String }, optional: false, nullable: false, api_name: "authProviderX509CertUrl"
      field :client_x_509_cert_url, -> { String }, optional: false, nullable: false, api_name: "clientX509CertUrl"
      field :universe_domain, -> { String }, optional: false, nullable: false, api_name: "universeDomain"
    end
  end
end
