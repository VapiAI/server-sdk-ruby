# frozen_string_literal: true

module Vapi
  module Types
    class PublicKeyEncryptionPlan < Internal::Types::Model
      field :algorithm, -> { Vapi::Types::PublicKeyEncryptionPlanAlgorithm }, optional: false, nullable: false
      field :public_key, -> { Vapi::Types::PublicKeyEncryptionPlanPublicKey }, optional: false, nullable: false, api_name: "publicKey"
    end
  end
end
