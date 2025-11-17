# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "vapi_server_sdk/assistants/client"
require_relative "vapi_server_sdk/squads/client"
require_relative "vapi_server_sdk/calls/client"
require_relative "vapi_server_sdk/chats/client"
require_relative "vapi_server_sdk/campaigns/client"
require_relative "vapi_server_sdk/sessions/client"
require_relative "vapi_server_sdk/phone_numbers/client"
require_relative "vapi_server_sdk/tools/client"
require_relative "vapi_server_sdk/files/client"
require_relative "vapi_server_sdk/structured_outputs/client"
require_relative "vapi_server_sdk/insight/client"
require_relative "vapi_server_sdk/eval/client"
require_relative "vapi_server_sdk/observability_scorecard/client"
require_relative "vapi_server_sdk/provider_resources/client"
require_relative "vapi_server_sdk/analytics/client"

module Vapi
  class Client
    # @return [Vapi::AssistantsClient]
    attr_reader :assistants
    # @return [Vapi::SquadsClient]
    attr_reader :squads
    # @return [Vapi::CallsClient]
    attr_reader :calls
    # @return [Vapi::ChatsClient]
    attr_reader :chats
    # @return [Vapi::CampaignsClient]
    attr_reader :campaigns
    # @return [Vapi::SessionsClient]
    attr_reader :sessions
    # @return [Vapi::PhoneNumbersClient]
    attr_reader :phone_numbers
    # @return [Vapi::ToolsClient]
    attr_reader :tools
    # @return [Vapi::FilesClient]
    attr_reader :files
    # @return [Vapi::StructuredOutputsClient]
    attr_reader :structured_outputs
    # @return [Vapi::InsightClient]
    attr_reader :insight
    # @return [Vapi::EvalClient]
    attr_reader :eval
    # @return [Vapi::ObservabilityScorecardClient]
    attr_reader :observability_scorecard
    # @return [Vapi::ProviderResourcesClient]
    attr_reader :provider_resources
    # @return [Vapi::AnalyticsClient]
    attr_reader :analytics

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
      @assistants = Vapi::AssistantsClient.new(request_client: @request_client)
      @squads = Vapi::SquadsClient.new(request_client: @request_client)
      @calls = Vapi::CallsClient.new(request_client: @request_client)
      @chats = Vapi::ChatsClient.new(request_client: @request_client)
      @campaigns = Vapi::CampaignsClient.new(request_client: @request_client)
      @sessions = Vapi::SessionsClient.new(request_client: @request_client)
      @phone_numbers = Vapi::PhoneNumbersClient.new(request_client: @request_client)
      @tools = Vapi::ToolsClient.new(request_client: @request_client)
      @files = Vapi::FilesClient.new(request_client: @request_client)
      @structured_outputs = Vapi::StructuredOutputsClient.new(request_client: @request_client)
      @insight = Vapi::InsightClient.new(request_client: @request_client)
      @eval = Vapi::EvalClient.new(request_client: @request_client)
      @observability_scorecard = Vapi::ObservabilityScorecardClient.new(request_client: @request_client)
      @provider_resources = Vapi::ProviderResourcesClient.new(request_client: @request_client)
      @analytics = Vapi::AnalyticsClient.new(request_client: @request_client)
    end
  end

  class AsyncClient
    # @return [Vapi::AsyncAssistantsClient]
    attr_reader :assistants
    # @return [Vapi::AsyncSquadsClient]
    attr_reader :squads
    # @return [Vapi::AsyncCallsClient]
    attr_reader :calls
    # @return [Vapi::AsyncChatsClient]
    attr_reader :chats
    # @return [Vapi::AsyncCampaignsClient]
    attr_reader :campaigns
    # @return [Vapi::AsyncSessionsClient]
    attr_reader :sessions
    # @return [Vapi::AsyncPhoneNumbersClient]
    attr_reader :phone_numbers
    # @return [Vapi::AsyncToolsClient]
    attr_reader :tools
    # @return [Vapi::AsyncFilesClient]
    attr_reader :files
    # @return [Vapi::AsyncStructuredOutputsClient]
    attr_reader :structured_outputs
    # @return [Vapi::AsyncInsightClient]
    attr_reader :insight
    # @return [Vapi::AsyncEvalClient]
    attr_reader :eval
    # @return [Vapi::AsyncObservabilityScorecardClient]
    attr_reader :observability_scorecard
    # @return [Vapi::AsyncProviderResourcesClient]
    attr_reader :provider_resources
    # @return [Vapi::AsyncAnalyticsClient]
    attr_reader :analytics

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
      @assistants = Vapi::AsyncAssistantsClient.new(request_client: @async_request_client)
      @squads = Vapi::AsyncSquadsClient.new(request_client: @async_request_client)
      @calls = Vapi::AsyncCallsClient.new(request_client: @async_request_client)
      @chats = Vapi::AsyncChatsClient.new(request_client: @async_request_client)
      @campaigns = Vapi::AsyncCampaignsClient.new(request_client: @async_request_client)
      @sessions = Vapi::AsyncSessionsClient.new(request_client: @async_request_client)
      @phone_numbers = Vapi::AsyncPhoneNumbersClient.new(request_client: @async_request_client)
      @tools = Vapi::AsyncToolsClient.new(request_client: @async_request_client)
      @files = Vapi::AsyncFilesClient.new(request_client: @async_request_client)
      @structured_outputs = Vapi::AsyncStructuredOutputsClient.new(request_client: @async_request_client)
      @insight = Vapi::AsyncInsightClient.new(request_client: @async_request_client)
      @eval = Vapi::AsyncEvalClient.new(request_client: @async_request_client)
      @observability_scorecard = Vapi::AsyncObservabilityScorecardClient.new(request_client: @async_request_client)
      @provider_resources = Vapi::AsyncProviderResourcesClient.new(request_client: @async_request_client)
      @analytics = Vapi::AsyncAnalyticsClient.new(request_client: @async_request_client)
    end
  end
end
