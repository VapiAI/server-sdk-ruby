# frozen_string_literal: true

module Vapi
  module Types
    class AssistantManagedVapiAgentsDto < Internal::Types::Model
      field :agent_id, -> { String }, optional: false, nullable: false, api_name: "agentId"
      field :agent_url, -> { String }, optional: false, nullable: false, api_name: "agentUrl"
      field :mcp_url, -> { String }, optional: false, nullable: false, api_name: "mcpUrl"
    end
  end
end
