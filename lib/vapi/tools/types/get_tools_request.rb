# frozen_string_literal: true

module Vapi
  module Tools
    module Types
      class GetToolsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
