# frozen_string_literal: true

module Vapi
  module Types
    class HmacAuthenticationPlan < Internal::Types::Model
      field :secret_key, -> { String }, optional: false, nullable: false, api_name: "secretKey"
      field :algorithm, -> { Vapi::Types::HmacAuthenticationPlanAlgorithm }, optional: false, nullable: false
      field :signature_header, -> { String }, optional: true, nullable: false, api_name: "signatureHeader"
      field :timestamp_header, -> { String }, optional: true, nullable: false, api_name: "timestampHeader"
      field :signature_prefix, -> { String }, optional: true, nullable: false, api_name: "signaturePrefix"
      field :include_timestamp, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "includeTimestamp"
      field :payload_format, -> { String }, optional: true, nullable: false, api_name: "payloadFormat"
      field :message_id_header, -> { String }, optional: true, nullable: false, api_name: "messageIdHeader"
      field :signature_encoding, -> { Vapi::Types::HmacAuthenticationPlanSignatureEncoding }, optional: true, nullable: false, api_name: "signatureEncoding"
      field :secret_is_base_64, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "secretIsBase64"
    end
  end
end
