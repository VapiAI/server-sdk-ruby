# frozen_string_literal: true

module Vapi
  # This is the protocol used for MCP communication. Defaults to Streamable HTTP.
  class McpToolMetadataProtocol
    SSE = "sse"
    SHTTP = "shttp"
  end
end
