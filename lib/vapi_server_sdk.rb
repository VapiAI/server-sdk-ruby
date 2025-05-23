# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "vapi_server_sdk/calls/client"
require_relative "vapi_server_sdk/assistants/client"
require_relative "vapi_server_sdk/phone_numbers/client"
require_relative "vapi_server_sdk/tools/client"
require_relative "vapi_server_sdk/files/client"
require_relative "vapi_server_sdk/knowledge_bases/client"
require_relative "vapi_server_sdk/workflow/client"
require_relative "vapi_server_sdk/squads/client"
require_relative "vapi_server_sdk/test_suites/client"
require_relative "vapi_server_sdk/test_suite_tests/client"
require_relative "vapi_server_sdk/test_suite_runs/client"
require_relative "vapi_server_sdk/analytics/client"
require_relative "vapi_server_sdk/logs/client"

module Vapi
  class Client
    # @return [Vapi::CallsClient]
    attr_reader :calls
    # @return [Vapi::AssistantsClient]
    attr_reader :assistants
    # @return [Vapi::PhoneNumbersClient]
    attr_reader :phone_numbers
    # @return [Vapi::ToolsClient]
    attr_reader :tools
    # @return [Vapi::FilesClient]
    attr_reader :files
    # @return [Vapi::KnowledgeBasesClient]
    attr_reader :knowledge_bases
    # @return [Vapi::WorkflowClient]
    attr_reader :workflow
    # @return [Vapi::SquadsClient]
    attr_reader :squads
    # @return [Vapi::TestSuitesClient]
    attr_reader :test_suites
    # @return [Vapi::TestSuiteTestsClient]
    attr_reader :test_suite_tests
    # @return [Vapi::TestSuiteRunsClient]
    attr_reader :test_suite_runs
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
      @tools = Vapi::ToolsClient.new(request_client: @request_client)
      @files = Vapi::FilesClient.new(request_client: @request_client)
      @knowledge_bases = Vapi::KnowledgeBasesClient.new(request_client: @request_client)
      @workflow = Vapi::WorkflowClient.new(request_client: @request_client)
      @squads = Vapi::SquadsClient.new(request_client: @request_client)
      @test_suites = Vapi::TestSuitesClient.new(request_client: @request_client)
      @test_suite_tests = Vapi::TestSuiteTestsClient.new(request_client: @request_client)
      @test_suite_runs = Vapi::TestSuiteRunsClient.new(request_client: @request_client)
      @analytics = Vapi::AnalyticsClient.new(request_client: @request_client)
      @logs = Vapi::LogsClient.new(request_client: @request_client)
    end

    # @param request_options [Vapi::RequestOptions]
    # @return [Void]
    def prometheus_controller_index(request_options: nil)
      @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/prometheus_metrics"
      end
    end
  end

  class AsyncClient
    # @return [Vapi::AsyncCallsClient]
    attr_reader :calls
    # @return [Vapi::AsyncAssistantsClient]
    attr_reader :assistants
    # @return [Vapi::AsyncPhoneNumbersClient]
    attr_reader :phone_numbers
    # @return [Vapi::AsyncToolsClient]
    attr_reader :tools
    # @return [Vapi::AsyncFilesClient]
    attr_reader :files
    # @return [Vapi::AsyncKnowledgeBasesClient]
    attr_reader :knowledge_bases
    # @return [Vapi::AsyncWorkflowClient]
    attr_reader :workflow
    # @return [Vapi::AsyncSquadsClient]
    attr_reader :squads
    # @return [Vapi::AsyncTestSuitesClient]
    attr_reader :test_suites
    # @return [Vapi::AsyncTestSuiteTestsClient]
    attr_reader :test_suite_tests
    # @return [Vapi::AsyncTestSuiteRunsClient]
    attr_reader :test_suite_runs
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
      @tools = Vapi::AsyncToolsClient.new(request_client: @async_request_client)
      @files = Vapi::AsyncFilesClient.new(request_client: @async_request_client)
      @knowledge_bases = Vapi::AsyncKnowledgeBasesClient.new(request_client: @async_request_client)
      @workflow = Vapi::AsyncWorkflowClient.new(request_client: @async_request_client)
      @squads = Vapi::AsyncSquadsClient.new(request_client: @async_request_client)
      @test_suites = Vapi::AsyncTestSuitesClient.new(request_client: @async_request_client)
      @test_suite_tests = Vapi::AsyncTestSuiteTestsClient.new(request_client: @async_request_client)
      @test_suite_runs = Vapi::AsyncTestSuiteRunsClient.new(request_client: @async_request_client)
      @analytics = Vapi::AsyncAnalyticsClient.new(request_client: @async_request_client)
      @logs = Vapi::AsyncLogsClient.new(request_client: @async_request_client)
    end

    # @param request_options [Vapi::RequestOptions]
    # @return [Void]
    def prometheus_controller_index(request_options: nil)
      @async_request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@async_request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@async_request_client.get_url(request_options: request_options)}/prometheus_metrics"
      end
    end
  end
end
