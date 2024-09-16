# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "vapi/calls/client"
require_relative "vapi/assistants/client"
require_relative "vapi/phone_numbers/client"
require_relative "vapi/squads/client"
require_relative "vapi/blocks/client"
require_relative "vapi/tools/client"
require_relative "vapi/files/client"
require_relative "vapi/analytics/client"
require_relative "vapi/logs/client"

module Vapi
  class Client
    # @return [Vapi::CallsClient]
    attr_reader :calls
    # @return [Vapi::AssistantsClient]
    attr_reader :assistants
    # @return [Vapi::PhoneNumbersClient]
    attr_reader :phone_numbers
    # @return [Vapi::SquadsClient]
    attr_reader :squads
    # @return [Vapi::BlocksClient]
    attr_reader :blocks
    # @return [Vapi::ToolsClient]
    attr_reader :tools
    # @return [Vapi::FilesClient]
    attr_reader :files
    # @return [Vapi::AnalyticsClient]
    attr_reader :analytics
    # @return [Vapi::LogsClient]
    attr_reader :logs

    # @param base_url [String]
    # @param environment [Vapi::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param token [String]
    # @return [Vapi::Client]
    def initialize(token:, base_url: nil, environment: Vapi::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @request_client = Vapi::RequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        token: token
      )
      @calls = Vapi::CallsClient.new(request_client: @request_client)
      @assistants = Vapi::AssistantsClient.new(request_client: @request_client)
      @phone_numbers = Vapi::PhoneNumbersClient.new(request_client: @request_client)
      @squads = Vapi::SquadsClient.new(request_client: @request_client)
      @blocks = Vapi::BlocksClient.new(request_client: @request_client)
      @tools = Vapi::ToolsClient.new(request_client: @request_client)
      @files = Vapi::FilesClient.new(request_client: @request_client)
      @analytics = Vapi::AnalyticsClient.new(request_client: @request_client)
      @logs = Vapi::LogsClient.new(request_client: @request_client)
    end
  end

  class AsyncClient
    # @return [Vapi::AsyncCallsClient]
    attr_reader :calls
    # @return [Vapi::AsyncAssistantsClient]
    attr_reader :assistants
    # @return [Vapi::AsyncPhoneNumbersClient]
    attr_reader :phone_numbers
    # @return [Vapi::AsyncSquadsClient]
    attr_reader :squads
    # @return [Vapi::AsyncBlocksClient]
    attr_reader :blocks
    # @return [Vapi::AsyncToolsClient]
    attr_reader :tools
    # @return [Vapi::AsyncFilesClient]
    attr_reader :files
    # @return [Vapi::AsyncAnalyticsClient]
    attr_reader :analytics
    # @return [Vapi::AsyncLogsClient]
    attr_reader :logs

    # @param base_url [String]
    # @param environment [Vapi::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param token [String]
    # @return [Vapi::AsyncClient]
    def initialize(token:, base_url: nil, environment: Vapi::Environment::DEFAULT, max_retries: nil,
                   timeout_in_seconds: nil)
      @async_request_client = Vapi::AsyncRequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        token: token
      )
      @calls = Vapi::AsyncCallsClient.new(request_client: @async_request_client)
      @assistants = Vapi::AsyncAssistantsClient.new(request_client: @async_request_client)
      @phone_numbers = Vapi::AsyncPhoneNumbersClient.new(request_client: @async_request_client)
      @squads = Vapi::AsyncSquadsClient.new(request_client: @async_request_client)
      @blocks = Vapi::AsyncBlocksClient.new(request_client: @async_request_client)
      @tools = Vapi::AsyncToolsClient.new(request_client: @async_request_client)
      @files = Vapi::AsyncFilesClient.new(request_client: @async_request_client)
      @analytics = Vapi::AsyncAnalyticsClient.new(request_client: @async_request_client)
      @logs = Vapi::AsyncLogsClient.new(request_client: @async_request_client)
    end
  end
end
