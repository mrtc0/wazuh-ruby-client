module Wazuh
  module Api
    module Endpoints
      module ActiveResponse
        #
        # Run an AR command in the agent
        # Runs an Active Response command on a specified agent.
        #
        # @param [String] agent_id
        # @option options [command] :command
        #   Command running in the agent. If this value starts by !, then it refers to a script name instead of a command name.
        # @option options [custom] :custom
        #   Whether the specified command is a custom command or not.
        # @option options [arguments] :arguments
        #   Array with command arguments.
        def run_active_response_command(agent_id, options = {})
          put "/active-response/#{agent_id}", options
        end
      end
    end
  end
end
