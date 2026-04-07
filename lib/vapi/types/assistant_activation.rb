# frozen_string_literal: true

module Vapi
  module Types
    class AssistantActivation < Internal::Types::Model
      field :assistant_name, -> { String }, optional: false, nullable: false, api_name: "assistantName"
      field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
    end
  end
end
