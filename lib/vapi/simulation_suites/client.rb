# frozen_string_literal: true

module Vapi
  module SimulationSuites
    class Client
      # @param client [Vapi::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Returns the simulation suites for the authenticated organization.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :assistant_id
      # @option params [String, nil] :squad_id
      # @option params [String, nil] :name
      # @option params [Integer, nil] :page
      # @option params [Vapi::SimulationSuites::Types::SimulationSuiteControllerFindAllRequestSortOrder, nil] :sort_order
      # @option params [Vapi::SimulationSuites::Types::SimulationSuiteControllerFindAllRequestSortBy, nil] :sort_by
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
      # @return [Vapi::SimulationSuites::Types::SimulationSuiteControllerFindAllResponse]
      def simulation_suite_controller_find_all(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[assistant_id squad_id name page sort_order sort_by limit created_at_gt created_at_lt created_at_ge created_at_le updated_at_gt updated_at_lt updated_at_ge updated_at_le]
        query_params = {}
        query_params["assistantId"] = params[:assistant_id] if params.key?(:assistant_id)
        query_params["squadId"] = params[:squad_id] if params.key?(:squad_id)
        query_params["name"] = params[:name] if params.key?(:name)
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
          path: "eval/simulation/suite",
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
          Vapi::SimulationSuites::Types::SimulationSuiteControllerFindAllResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a simulation suite, a group of simulations that run together.
      #
      # @param request_options [Hash]
      # @param params [Vapi::SimulationSuites::Types::CreateSimulationSuiteDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Vapi::Types::SimulationSuite]
      def simulation_suite_controller_create(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "eval/simulation/suite",
          body: Vapi::SimulationSuites::Types::CreateSimulationSuiteDto.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::SimulationSuite.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Vapi::Types::SimulationSuite]
      def simulation_suite_controller_duplicate(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "eval/simulation/suite/#{URI.encode_uri_component(params[:id].to_s)}/duplicate",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::SimulationSuite.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns the specified simulation suite.
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
      # @return [Vapi::Types::SimulationSuite]
      def simulation_suite_controller_find_one(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "eval/simulation/suite/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::SimulationSuite.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deletes the specified simulation suite.
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
      # @return [Vapi::Types::SimulationSuite]
      def simulation_suite_controller_remove(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "eval/simulation/suite/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::SimulationSuite.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates the specified simulation suite.
      #
      # @param request_options [Hash]
      # @param params [Vapi::SimulationSuites::Types::UpdateSimulationSuiteDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Vapi::Types::SimulationSuite]
      def simulation_suite_controller_update(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request_data = Vapi::SimulationSuites::Types::UpdateSimulationSuiteDto.new(params).to_h
        non_body_param_names = ["id"]
        body = request_data.except(*non_body_param_names)

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "eval/simulation/suite/#{URI.encode_uri_component(params[:id].to_s)}",
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
          Vapi::Types::SimulationSuite.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Generate draft test requirements from an assistant's prompt, tools, and handoff configuration. The response
      # includes numbered requirements describing expected behavior and open questions about behavior that needs
      # clarification. Use this endpoint before generating a simulation suite.
      #
      # Review the requirements and resolve any open questions. To revise a draft, send it as `previousDraft` together
      # with natural-language `feedback` describing the changes or answers. Once the requirements are ready, pass them
      # to `POST /eval/simulation/onboarding/suite`.
      #
      # Requests can take up to 2 minutes. Each organization can draft requirements 60 times per UTC day, shared with
      # the dashboard. A 429 `SIMULATION_ONBOARDING_QUOTA_EXCEEDED` response means the daily limit has been reached.
      # Wait until the limit resets at 00:00 UTC before retrying.
      #
      # @param request_options [Hash]
      # @param params [Vapi::SimulationSuites::Types::SimulationOnboardingRequirementsCreateDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Vapi::Types::SimulationOnboardingRequirementsDraftDto]
      def simulation_onboarding_controller_requirements_draft(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "eval/simulation/onboarding/requirements",
          body: Vapi::SimulationSuites::Types::SimulationOnboardingRequirementsCreateDto.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::SimulationOnboardingRequirementsDraftDto.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Generate and save a simulation suite from reviewed test requirements, and assign it to an assistant. First draft
      # requirements with `POST /eval/simulation/onboarding/requirements`. The response includes the saved suite, its
      # simulations, and requirement coverage, including any gaps.
      #
      # Requests can take up to 3 minutes. Set a client timeout of at least 200 seconds.
      #
      # Use a unique `idempotencyKey` for each suite generation request. Retrying with the same key does not create a
      # duplicate suite:
      # - On a timeout or a 5xx (502, 504, 524), retry with the same key. You get the saved suite, a 409 while it is
      # still generating, or a fresh generation if the first one never saved.
      # - On a 409 `SIMULATION_ONBOARDING_GENERATION_IN_PROGRESS`, the first request is still generating. Wait
      # `Retry-After` seconds (15) and retry with the same key.
      # - On a 409 `SIMULATION_ONBOARDING_IDEMPOTENCY_KEY_REUSED`, the key was used for a different assistant or
      # requirements. Send a new key.
      #
      # Review the generated simulations and coverage gaps. Revise the suite with `PATCH
      # /eval/simulation/onboarding/suite/{suiteId}`, then run it with `POST /eval/simulation/run`.
      #
      # Each organization can generate 20 suites per UTC day, shared with the dashboard, and 2 at a time. A retry that
      # returns a saved suite does not count toward these limits. On a 429 `SIMULATION_ONBOARDING_CONCURRENCY_LIMITED`,
      # wait `Retry-After` seconds (30) before retrying. On a 429 `SIMULATION_ONBOARDING_QUOTA_EXCEEDED`, wait until the
      # daily limit resets at 00:00 UTC before retrying.
      #
      # @param request_options [Hash]
      # @param params [Vapi::SimulationSuites::Types::SimulationOnboardingSuiteCreateDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Vapi::Types::SimulationOnboardingSuiteViewDto]
      def simulation_onboarding_controller_suite_create(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "eval/simulation/onboarding/suite",
          body: Vapi::SimulationSuites::Types::SimulationOnboardingSuiteCreateDto.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::SimulationOnboardingSuiteViewDto.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Revise a suite created by `POST /eval/simulation/onboarding/suite`. Remove simulations, rewrite scenarios using
      # natural-language instructions, or set `retryFailed` to regenerate scenarios that failed or exceeded generation
      # limits. The response includes the updated suite and requirement coverage.
      #
      # Requests can take up to 2 minutes.
      #
      # Send a new `patchKey` for each edit. Replaying an applied key changes nothing and returns the current suite,
      # with `failedEditSimulationIds` listing the simulations that edit could not rewrite, so retry a timeout or a 5xx
      # with the same key. A suite remembers its last 50 keys, so never reuse one.
      #
      # Each organization can make 60 edits per UTC day, shared with the dashboard. Requests that only remove
      # simulations and replays of applied edits do not count toward this limit. On a 429
      # `SIMULATION_ONBOARDING_QUOTA_EXCEEDED`, wait until the daily limit resets at 00:00 UTC before retrying.
      #
      # @param request_options [Hash]
      # @param params [Vapi::SimulationSuites::Types::SimulationOnboardingSuiteUpdateDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :suite_id
      #
      # @return [Vapi::Types::SimulationOnboardingSuiteViewDto]
      def simulation_onboarding_controller_suite_update(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request_data = Vapi::SimulationSuites::Types::SimulationOnboardingSuiteUpdateDto.new(params).to_h
        non_body_param_names = ["suiteId"]
        body = request_data.except(*non_body_param_names)

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "eval/simulation/onboarding/suite/#{URI.encode_uri_component(params[:suite_id].to_s)}",
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
          Vapi::Types::SimulationOnboardingSuiteViewDto.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
