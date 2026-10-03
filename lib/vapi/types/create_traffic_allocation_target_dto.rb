# frozen_string_literal: true

module Vapi
  module Types
    class CreateTrafficAllocationTargetDto < Internal::Types::Model
      field :assistant_version, -> { String }, optional: false, nullable: false, api_name: "assistantVersion"
      field :percentage, -> { Integer }, optional: false, nullable: false
    end
  end
end
