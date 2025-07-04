# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/test_suite_test_controller_find_all_paginated_request_sort_order"
require "date"
require_relative "../types/test_suite_tests_paginated_response"
require_relative "types/test_suite_test_controller_create_request"
require_relative "types/test_suite_test_controller_create_response"
require_relative "types/test_suite_test_controller_find_one_response"
require_relative "types/test_suite_test_controller_remove_response"
require_relative "types/test_suite_test_controller_update_request"
require_relative "types/test_suite_test_controller_update_response"
require "async"

module Vapi
  class TestSuiteTestsClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::TestSuiteTestsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param test_suite_id [String]
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::TestSuiteTests::TestSuiteTestControllerFindAllPaginatedRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
    # @param limit [Float] This is the maximum number of items to return. Defaults to 100.
    # @param created_at_gt [DateTime] This will return items where the createdAt is greater than the specified value.
    # @param created_at_lt [DateTime] This will return items where the createdAt is less than the specified value.
    # @param created_at_ge [DateTime] This will return items where the createdAt is greater than or equal to the
    #  specified value.
    # @param created_at_le [DateTime] This will return items where the createdAt is less than or equal to the
    #  specified value.
    # @param updated_at_gt [DateTime] This will return items where the updatedAt is greater than the specified value.
    # @param updated_at_lt [DateTime] This will return items where the updatedAt is less than the specified value.
    # @param updated_at_ge [DateTime] This will return items where the updatedAt is greater than or equal to the
    #  specified value.
    # @param updated_at_le [DateTime] This will return items where the updatedAt is less than or equal to the
    #  specified value.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::TestSuiteTestsPaginatedResponse]
    def test_suite_test_controller_find_all_paginated(test_suite_id:, page: nil, sort_order: nil, limit: nil,
                                                      created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "page": page,
          "sortOrder": sort_order,
          "limit": limit,
          "createdAtGt": created_at_gt,
          "createdAtLt": created_at_lt,
          "createdAtGe": created_at_ge,
          "createdAtLe": created_at_le,
          "updatedAtGt": updated_at_gt,
          "updatedAtLt": updated_at_lt,
          "updatedAtGe": updated_at_ge,
          "updatedAtLe": updated_at_le
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/test-suite/#{test_suite_id}/test"
      end
      Vapi::TestSuiteTestsPaginatedResponse.from_json(json_object: response.body)
    end

    # @param test_suite_id [String]
    # @param request [Vapi::TestSuiteTests::TestSuiteTestControllerCreateRequest]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::TestSuiteTests::TestSuiteTestControllerCreateResponse]
    def test_suite_test_controller_create(test_suite_id:, request:, request_options: nil)
      response = @request_client.conn.post do |req|
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
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/test-suite/#{test_suite_id}/test"
      end
      Vapi::TestSuiteTests::TestSuiteTestControllerCreateResponse.from_json(json_object: response.body)
    end

    # @param test_suite_id [String]
    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::TestSuiteTests::TestSuiteTestControllerFindOneResponse]
    def test_suite_test_controller_find_one(test_suite_id:, id:, request_options: nil)
      response = @request_client.conn.get do |req|
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
        req.url "#{@request_client.get_url(request_options: request_options)}/test-suite/#{test_suite_id}/test/#{id}"
      end
      Vapi::TestSuiteTests::TestSuiteTestControllerFindOneResponse.from_json(json_object: response.body)
    end

    # @param test_suite_id [String]
    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::TestSuiteTests::TestSuiteTestControllerRemoveResponse]
    def test_suite_test_controller_remove(test_suite_id:, id:, request_options: nil)
      response = @request_client.conn.delete do |req|
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
        req.url "#{@request_client.get_url(request_options: request_options)}/test-suite/#{test_suite_id}/test/#{id}"
      end
      Vapi::TestSuiteTests::TestSuiteTestControllerRemoveResponse.from_json(json_object: response.body)
    end

    # @param test_suite_id [String]
    # @param id [String]
    # @param request [Vapi::TestSuiteTests::TestSuiteTestControllerUpdateRequest]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::TestSuiteTests::TestSuiteTestControllerUpdateResponse]
    def test_suite_test_controller_update(test_suite_id:, id:, request:, request_options: nil)
      response = @request_client.conn.patch do |req|
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
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/test-suite/#{test_suite_id}/test/#{id}"
      end
      Vapi::TestSuiteTests::TestSuiteTestControllerUpdateResponse.from_json(json_object: response.body)
    end
  end

  class AsyncTestSuiteTestsClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncTestSuiteTestsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param test_suite_id [String]
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::TestSuiteTests::TestSuiteTestControllerFindAllPaginatedRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
    # @param limit [Float] This is the maximum number of items to return. Defaults to 100.
    # @param created_at_gt [DateTime] This will return items where the createdAt is greater than the specified value.
    # @param created_at_lt [DateTime] This will return items where the createdAt is less than the specified value.
    # @param created_at_ge [DateTime] This will return items where the createdAt is greater than or equal to the
    #  specified value.
    # @param created_at_le [DateTime] This will return items where the createdAt is less than or equal to the
    #  specified value.
    # @param updated_at_gt [DateTime] This will return items where the updatedAt is greater than the specified value.
    # @param updated_at_lt [DateTime] This will return items where the updatedAt is less than the specified value.
    # @param updated_at_ge [DateTime] This will return items where the updatedAt is greater than or equal to the
    #  specified value.
    # @param updated_at_le [DateTime] This will return items where the updatedAt is less than or equal to the
    #  specified value.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::TestSuiteTestsPaginatedResponse]
    def test_suite_test_controller_find_all_paginated(test_suite_id:, page: nil, sort_order: nil, limit: nil,
                                                      created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "page": page,
            "sortOrder": sort_order,
            "limit": limit,
            "createdAtGt": created_at_gt,
            "createdAtLt": created_at_lt,
            "createdAtGe": created_at_ge,
            "createdAtLe": created_at_le,
            "updatedAtGt": updated_at_gt,
            "updatedAtLt": updated_at_lt,
            "updatedAtGe": updated_at_ge,
            "updatedAtLe": updated_at_le
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/test-suite/#{test_suite_id}/test"
        end
        Vapi::TestSuiteTestsPaginatedResponse.from_json(json_object: response.body)
      end
    end

    # @param test_suite_id [String]
    # @param request [Vapi::TestSuiteTests::TestSuiteTestControllerCreateRequest]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::TestSuiteTests::TestSuiteTestControllerCreateResponse]
    def test_suite_test_controller_create(test_suite_id:, request:, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
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
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/test-suite/#{test_suite_id}/test"
        end
        Vapi::TestSuiteTests::TestSuiteTestControllerCreateResponse.from_json(json_object: response.body)
      end
    end

    # @param test_suite_id [String]
    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::TestSuiteTests::TestSuiteTestControllerFindOneResponse]
    def test_suite_test_controller_find_one(test_suite_id:, id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/test-suite/#{test_suite_id}/test/#{id}"
        end
        Vapi::TestSuiteTests::TestSuiteTestControllerFindOneResponse.from_json(json_object: response.body)
      end
    end

    # @param test_suite_id [String]
    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::TestSuiteTests::TestSuiteTestControllerRemoveResponse]
    def test_suite_test_controller_remove(test_suite_id:, id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/test-suite/#{test_suite_id}/test/#{id}"
        end
        Vapi::TestSuiteTests::TestSuiteTestControllerRemoveResponse.from_json(json_object: response.body)
      end
    end

    # @param test_suite_id [String]
    # @param id [String]
    # @param request [Vapi::TestSuiteTests::TestSuiteTestControllerUpdateRequest]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::TestSuiteTests::TestSuiteTestControllerUpdateResponse]
    def test_suite_test_controller_update(test_suite_id:, id:, request:, request_options: nil)
      Async do
        response = @request_client.conn.patch do |req|
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
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/test-suite/#{test_suite_id}/test/#{id}"
        end
        Vapi::TestSuiteTests::TestSuiteTestControllerUpdateResponse.from_json(json_object: response.body)
      end
    end
  end
end
