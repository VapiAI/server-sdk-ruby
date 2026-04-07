# frozen_string_literal: true

module Vapi
  module Types
    class AssistantUserEditable < Internal::Types::Model
      field :server_messages, -> { Object }, optional: true, nullable: false, api_name: "serverMessages"
    end
  end
end
