# frozen_string_literal: true

module Vapi
  module Tools
    module Types
      class UpdateToolsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :body, -> { Vapi::Tools::Types::UpdateToolsRequestBody }, optional: false, nullable: false
      end
    end
  end
end
