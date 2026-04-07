# frozen_string_literal: true

module Vapi
  module Types
    class ExactReplacement < Internal::Types::Model
      field :replace_all_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "replaceAllEnabled"
      field :key, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
