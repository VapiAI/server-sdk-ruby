# frozen_string_literal: true

module Vapi
  module TrafficAllocations
    class Client
      # @param client [Vapi::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The append-only history of an assistant's allocations, newest first. Traffic splitting is in beta, rolling out
      # to select organizations; requests from organizations without access receive a 403.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :assistant_id
      # @option params [Integer, nil] :page
      # @option params [Integer, nil] :limit
      # @option params [Vapi::TrafficAllocations::Types::TrafficAllocationControllerFindAllPaginatedRequestSortOrder, nil] :sort_order
      #
      # @return [Vapi::Types::TrafficAllocationPaginatedResponse]
      def traffic_allocation_controller_find_all_paginated(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[assistant_id page limit sort_order]
        query_params = {}
        query_params["assistantId"] = params[:assistant_id] if params.key?(:assistant_id)
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["sortOrder"] = params[:sort_order] if params.key?(:sort_order)
        params.except(*query_param_names)

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "traffic-allocations",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::TrafficAllocationPaginatedResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a new traffic allocation for an assistant, replacing the one currently in effect. To start or adjust a
      # split, send targets naming published versions (such as "v7") with percentages totaling 100; allocationIntent is
      # inferred as 'explicit'. To stop splitting and send every call to the newest published version, send
      # allocationIntent 'follow-latest' with no targets field; stopping always names its intent, so a dropped targets
      # field can never end a split by accident. Traffic splitting is in beta, rolling out to select organizations;
      # requests from organizations without access receive a 403.
      #
      # @param request_options [Hash]
      # @param params [Vapi::TrafficAllocations::Types::CreateTrafficAllocationDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Vapi::Types::TrafficAllocation]
      def traffic_allocation_controller_create(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "traffic-allocations",
          body: Vapi::TrafficAllocations::Types::CreateTrafficAllocationDto.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::TrafficAllocation.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # The allocation currently in effect for the assistant, with its targets. The response carries no allocation field
      # when traffic splitting has never been configured. Traffic splitting is in beta, rolling out to select
      # organizations; requests from organizations without access receive a 403.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :assistant_id
      #
      # @return [Vapi::Types::TrafficAllocationLatestResponseDto]
      def traffic_allocation_controller_latest_get(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[assistant_id]
        query_params = {}
        query_params["assistantId"] = params[:assistant_id] if params.key?(:assistant_id)
        params.except(*query_param_names)

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "traffic-allocations/latest",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::TrafficAllocationLatestResponseDto.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns a single allocation by id, including its targets and actor attribution. Traffic splitting is in beta,
      # rolling out to select organizations; requests from organizations without access receive a 403.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Vapi::Types::TrafficAllocation]
      def traffic_allocation_controller_find_one(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "traffic-allocations/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::TrafficAllocation.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
