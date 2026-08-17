# frozen_string_literal: true

module Vapi
  module SimulationRuns
    class Client
      # @param client [Vapi::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns the simulation runs for the authenticated organization.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Vapi::SimulationRuns::Types::SimulationRunControllerFindAllRequestStatus, nil] :status
      # @option params [Vapi::SimulationRuns::Types::SimulationRunControllerFindAllRequestFilterStatus, nil] :filter_status
      # @option params [Vapi::SimulationRuns::Types::SimulationRunControllerFindAllRequestTargetType, nil] :target_type
      # @option params [String, nil] :target_id
      # @option params [Integer, nil] :page
      # @option params [Vapi::SimulationRuns::Types::SimulationRunControllerFindAllRequestSortOrder, nil] :sort_order
      # @option params [Vapi::SimulationRuns::Types::SimulationRunControllerFindAllRequestSortBy, nil] :sort_by
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :created_at_gt
      # @option params [String, nil] :created_at_lt
      # @option params [String, nil] :created_at_ge
      # @option params [String, nil] :created_at_le
      # @option params [String, nil] :updated_at_gt
      # @option params [String, nil] :updated_at_lt
      # @option params [String, nil] :updated_at_ge
      # @option params [String, nil] :updated_at_le
      #
      # @return [Vapi::SimulationRuns::Types::SimulationRunControllerFindAllResponse]
      def simulation_run_controller_find_all(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[status filter_status target_type target_id page sort_order sort_by limit created_at_gt created_at_lt created_at_ge created_at_le updated_at_gt updated_at_lt updated_at_ge updated_at_le]
        query_params = {}
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["filterStatus"] = params[:filter_status] if params.key?(:filter_status)
        query_params["targetType"] = params[:target_type] if params.key?(:target_type)
        query_params["targetId"] = params[:target_id] if params.key?(:target_id)
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["sortOrder"] = params[:sort_order] if params.key?(:sort_order)
        query_params["sortBy"] = params[:sort_by] if params.key?(:sort_by)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["createdAtGt"] = params[:created_at_gt] if params.key?(:created_at_gt)
        query_params["createdAtLt"] = params[:created_at_lt] if params.key?(:created_at_lt)
        query_params["createdAtGe"] = params[:created_at_ge] if params.key?(:created_at_ge)
        query_params["createdAtLe"] = params[:created_at_le] if params.key?(:created_at_le)
        query_params["updatedAtGt"] = params[:updated_at_gt] if params.key?(:updated_at_gt)
        query_params["updatedAtLt"] = params[:updated_at_lt] if params.key?(:updated_at_lt)
        query_params["updatedAtGe"] = params[:updated_at_ge] if params.key?(:updated_at_ge)
        query_params["updatedAtLe"] = params[:updated_at_le] if params.key?(:updated_at_le)
        params.except(*query_param_names)

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "eval/simulation/run",
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
          Vapi::SimulationRuns::Types::SimulationRunControllerFindAllResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Starts a simulation run against a target assistant or squad.
      #
      # @param request_options [Hash]
      # @param params [Vapi::SimulationRuns::Types::CreateSimulationRunDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :client_source
      # @option params [String, nil] :simulation_entry_point
      #
      # @return [Vapi::Types::CreateSimulationRunResponse]
      def simulation_run_controller_create(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request_data = Vapi::SimulationRuns::Types::CreateSimulationRunDto.new(params).to_h
        non_body_param_names = %w[x-client-source x-simulation-entry-point]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["x-client-source"] = params[:client_source] if params[:client_source]
        headers["x-simulation-entry-point"] = params[:simulation_entry_point] if params[:simulation_entry_point]

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "eval/simulation/run",
          headers: headers,
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::CreateSimulationRunResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the specified simulation run, including its status and item counts.
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
      # @return [Vapi::Types::SimulationRun]
      def simulation_run_controller_find_one(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "eval/simulation/run/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::SimulationRun.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Cancels the specified simulation run.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String, nil] :client_source
      # @option params [String, nil] :simulation_entry_point
      #
      # @return [Vapi::Types::SimulationRun]
      def simulation_run_controller_cancel_group(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["x-client-source"] = params[:client_source] if params[:client_source]
        headers["x-simulation-entry-point"] = params[:simulation_entry_point] if params[:simulation_entry_point]

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "eval/simulation/run/#{URI.encode_uri_component(params[:id].to_s)}",
          headers: headers,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::SimulationRun.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the run items for the specified simulation run.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String, nil] :simulation_id
      # @option params [String, nil] :run_id
      # @option params [Vapi::SimulationRuns::Types::SimulationRunControllerFindItemsRequestStatus, nil] :status
      # @option params [Integer, nil] :page
      # @option params [Vapi::SimulationRuns::Types::SimulationRunControllerFindItemsRequestSortOrder, nil] :sort_order
      # @option params [Vapi::SimulationRuns::Types::SimulationRunControllerFindItemsRequestSortBy, nil] :sort_by
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :created_at_gt
      # @option params [String, nil] :created_at_lt
      # @option params [String, nil] :created_at_ge
      # @option params [String, nil] :created_at_le
      # @option params [String, nil] :updated_at_gt
      # @option params [String, nil] :updated_at_lt
      # @option params [String, nil] :updated_at_ge
      # @option params [String, nil] :updated_at_le
      #
      # @return [Array[Vapi::Types::SimulationRunItem]]
      def simulation_run_controller_find_items(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[simulation_id run_id status page sort_order sort_by limit created_at_gt created_at_lt created_at_ge created_at_le updated_at_gt updated_at_lt updated_at_ge updated_at_le]
        query_params = {}
        query_params["simulationId"] = params[:simulation_id] if params.key?(:simulation_id)
        query_params["runId"] = params[:run_id] if params.key?(:run_id)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["sortOrder"] = params[:sort_order] if params.key?(:sort_order)
        query_params["sortBy"] = params[:sort_by] if params.key?(:sort_by)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["createdAtGt"] = params[:created_at_gt] if params.key?(:created_at_gt)
        query_params["createdAtLt"] = params[:created_at_lt] if params.key?(:created_at_lt)
        query_params["createdAtGe"] = params[:created_at_ge] if params.key?(:created_at_ge)
        query_params["createdAtLe"] = params[:created_at_le] if params.key?(:created_at_le)
        query_params["updatedAtGt"] = params[:updated_at_gt] if params.key?(:updated_at_gt)
        query_params["updatedAtLt"] = params[:updated_at_lt] if params.key?(:updated_at_lt)
        query_params["updatedAtGe"] = params[:updated_at_ge] if params.key?(:updated_at_ge)
        query_params["updatedAtLe"] = params[:updated_at_le] if params.key?(:updated_at_le)
        params = params.except(*query_param_names)

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "eval/simulation/run/#{URI.encode_uri_component(params[:id].to_s)}/item",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end

      # Returns the specified run item, including its evaluation results and the ID of the call that ran it.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :item_id
      #
      # @return [Vapi::Types::SimulationRunItem]
      def simulation_run_controller_find_item(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "eval/simulation/run/#{URI.encode_uri_component(params[:id].to_s)}/item/#{URI.encode_uri_component(params[:item_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::SimulationRunItem.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Cancels the specified run item.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :item_id
      #
      # @return [Vapi::Types::SimulationRunItem]
      def simulation_run_controller_cancel_item(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "eval/simulation/run/#{URI.encode_uri_component(params[:id].to_s)}/item/#{URI.encode_uri_component(params[:item_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::SimulationRunItem.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Generates AI suggestions for improving the assistant or squad's system prompt, tools, and scenarios, based on
      # the specified run item.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String] :item_id
      # @option params [String] :force
      # @option params [String, nil] :persist
      #
      # @return [untyped]
      def simulation_run_controller_generate_suggestions(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[force persist]
        query_params = {}
        query_params["force"] = params[:force] if params.key?(:force)
        query_params["persist"] = params[:persist] if params.key?(:persist)
        params = params.except(*query_param_names)

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "eval/simulation/run/#{URI.encode_uri_component(params[:id].to_s)}/item/#{URI.encode_uri_component(params[:item_id].to_s)}/generate",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        return if code.between?(200, 299)

        error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
        raise error_class.new(response.body, code: code)
      end
    end
  end
end
