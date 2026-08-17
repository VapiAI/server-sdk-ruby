# frozen_string_literal: true

module Vapi
  module Simulations
    class Client
      # @param client [Vapi::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Generates scenarios for an assistant or squad by analyzing its configuration with AI.
      #
      # @param request_options [Hash]
      # @param params [Vapi::Simulations::Types::GenerateScenariosDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :client_source
      # @option params [String, nil] :simulation_entry_point
      #
      # @return [Vapi::Types::GenerateScenariosResponse]
      def simulation_generate_controller_generate(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request_data = Vapi::Simulations::Types::GenerateScenariosDto.new(params).to_h
        non_body_param_names = %w[x-client-source x-simulation-entry-point]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["x-client-source"] = params[:client_source] if params[:client_source]
        headers["x-simulation-entry-point"] = params[:simulation_entry_point] if params[:simulation_entry_point]

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "eval/simulation/scenario/generate",
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
          Vapi::Types::GenerateScenariosResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the simulations for the authenticated organization.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :id_any
      # @option params [Boolean, nil] :standalone_only
      # @option params [Integer, nil] :page
      # @option params [Vapi::Simulations::Types::SimulationControllerFindAllRequestSortOrder, nil] :sort_order
      # @option params [Vapi::Simulations::Types::SimulationControllerFindAllRequestSortBy, nil] :sort_by
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
      # @return [Array[Vapi::Types::Simulation]]
      def simulation_controller_find_all(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[id_any standalone_only page sort_order sort_by limit created_at_gt created_at_lt created_at_ge created_at_le updated_at_gt updated_at_lt updated_at_ge updated_at_le]
        query_params = {}
        query_params["idAny"] = params[:id_any] if params.key?(:id_any)
        query_params["standaloneOnly"] = params[:standalone_only] if params.key?(:standalone_only)
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
          path: "eval/simulation",
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

      # Creates a simulation by pairing a scenario with a personality.
      #
      # @param request_options [Hash]
      # @param params [Vapi::Simulations::Types::CreateSimulationDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :client_source
      # @option params [String, nil] :simulation_entry_point
      #
      # @return [Vapi::Types::Simulation]
      def simulation_controller_create(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request_data = Vapi::Simulations::Types::CreateSimulationDto.new(params).to_h
        non_body_param_names = %w[x-client-source x-simulation-entry-point]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["x-client-source"] = params[:client_source] if params[:client_source]
        headers["x-simulation-entry-point"] = params[:simulation_entry_point] if params[:simulation_entry_point]

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "eval/simulation",
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
          Vapi::Types::Simulation.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the specified simulation.
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
      # @return [Vapi::Types::Simulation]
      def simulation_controller_find_one(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "eval/simulation/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::Simulation.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deletes the specified simulation.
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
      # @return [Vapi::Types::Simulation]
      def simulation_controller_remove(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        headers = {}
        headers["x-client-source"] = params[:client_source] if params[:client_source]
        headers["x-simulation-entry-point"] = params[:simulation_entry_point] if params[:simulation_entry_point]

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "eval/simulation/#{URI.encode_uri_component(params[:id].to_s)}",
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
          Vapi::Types::Simulation.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates the specified simulation.
      #
      # @param request_options [Hash]
      # @param params [Vapi::Simulations::Types::UpdateSimulationDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      # @option params [String, nil] :client_source
      # @option params [String, nil] :simulation_entry_point
      #
      # @return [Vapi::Types::Simulation]
      def simulation_controller_update(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request_data = Vapi::Simulations::Types::UpdateSimulationDto.new(params).to_h
        non_body_param_names = %w[id x-client-source x-simulation-entry-point]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["x-client-source"] = params[:client_source] if params[:client_source]
        headers["x-simulation-entry-point"] = params[:simulation_entry_point] if params[:simulation_entry_point]

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "eval/simulation/#{URI.encode_uri_component(params[:id].to_s)}",
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
          Vapi::Types::Simulation.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the organization's simulation concurrency limit, the number of active simulations, and how many more can
      # start.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Vapi::Types::SimulationConcurrencyResponse]
      def simulation_controller_get_concurrency(request_options: {}, **params)
        Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "eval/simulation/concurrency",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::SimulationConcurrencyResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
