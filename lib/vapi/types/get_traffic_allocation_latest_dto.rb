# frozen_string_literal: true

module Vapi
  module Types
    class GetTrafficAllocationLatestDto < Internal::Types::Model
      field :assistant_id, -> { String }, optional: false, nullable: false, api_name: "assistantId"
    end
  end
end
