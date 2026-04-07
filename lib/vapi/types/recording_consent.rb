# frozen_string_literal: true

module Vapi
  module Types
    class RecordingConsent < Internal::Types::Model
      field :type, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
      field :granted_at, -> { String }, optional: true, nullable: false, api_name: "grantedAt"
    end
  end
end
