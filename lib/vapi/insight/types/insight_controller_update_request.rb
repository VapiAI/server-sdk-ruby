# frozen_string_literal: true

module Vapi
  module Insight
    module Types
      class InsightControllerUpdateRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :body, -> { Vapi::Insight::Types::InsightControllerUpdateRequestBody }, optional: false, nullable: false
      end
    end
  end
end
