# frozen_string_literal: true

module Vapi
  module Sessions
    module Types
      class GetSessionsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
