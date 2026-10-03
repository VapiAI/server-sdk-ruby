# frozen_string_literal: true

module Vapi
  module Types
    class TrafficAllocationTarget < Internal::Types::Model
      field :assistant_version, -> { String }, optional: false, nullable: false, api_name: "assistantVersion"
      field :position, -> { Integer }, optional: false, nullable: false
      field :percentage, -> { Integer }, optional: false, nullable: false
    end
  end
end
