# frozen_string_literal: true

module Vapi
  module Types
    class CredentialActionRequest < Internal::Types::Model
      field :action_name, -> { String }, optional: false, nullable: false
      field :input, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
