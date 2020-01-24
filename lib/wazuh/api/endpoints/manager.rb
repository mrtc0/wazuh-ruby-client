module Wazuh
  module Api
    module Endpoints
      module Manager
        # Get manager active configuration
        # Returns the requested configuration in JSON format.
        #
        # @param [String] component
        #   Selected component.
        # @param [String] configuration
        #   Configuration to read.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-manager-active-configuration
        def manager_active_configuration(component, configuration)
          get "/manager/config/#{component}/#{configuration}"
        end

        # Get manager configuration
        # Returns ossec.conf in JSON format.
        #
        # @option options [section] :section
        #   Indicates the ossec.conf section: global, rules, syscheck, rootcheck, remote, alerts, command, active-response, localfile.
        # @option options [field] :field
        #   Indicates a section child, e.g, fields for rule section are: include, decoder_dir, etc.
        def manager_configuration(options = {})
          get '/manager/configuration', options
        end

        # Check Wazuh configuration
        # Returns if Wazuh configuration is OK.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#check-wazuh-configuration
        def check_manager_configuration
          get '/manager/configuration/validation'
        end

        # Delete a local file
        # Confirmation message.
        #
        # @option options [path] :path
        #   Relative path of file. This parameter is mandatory.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#delete-a-local-file
        def delete_manager_local_file(options = {})
          delete '/manager/files', options
        end

        # Get local file
        # Returns the content of a local file (rules, decoders and lists).
        #
        # @option options [path] :path
        #   Relative path of file. This parameter is mandatory.
        # @option options [validation] :validation
        #   Validates the content of the file. An error will be returned if file content is not strictly correct. False by default.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-local-file
        def get_manager_local_file(options = {})
          get '/manager/files', options
        end

        # Update local file
        # Upload a local file (rules, decoders and lists).
        #
        # @option options [path] :path
        #   Relative path of file. This parameter is mandatory.
        # @option options [validation] :validation
        #   Validates the content of the file. An error will be returned if file content is not strictly correct. False by default.
        # @option options [overwrite] :overwrite
        #   Replaces the existing file. False by default.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#update-local-file
        def update_manager_local_file(options = {})
          post '/manager/files', options
        end

        # Get manager information
        # Returns basic information about manager.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-manager-information
        def manager_information
          get '/manager/info'
        end

        # Get manager status
        # Returns the status of the manager processes.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-manager-status
        def manager_status
          get '/manager/status'
        end

        # Get ossec.log
        # Returns the three last months of ossec.log.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-ossec-log
        def manager_log
          get '/manager/logs'
        end

        # Get summary of ossec.log
        # Returns a summary of the last three months of the <code>ossec.log</code> file.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-summary-of-ossec-log
        def manager_summary_log
          get '/manager/logs/summary'
        end

        # Restart Wazuh manager
        # Restarts Wazuh manager.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#restart-wazuh-manager
        def restart_manager
          put '/manager/restart'
        end

        # Get analysisd stats
        # Returns a summary of the current analysisd stats.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-analysisd-stats
        def manager_analysisd_stats
          get '/manager/stats/analysisd'
        end

        # Get manager stats
        # Returns Wazuh statistical information for the current or specified date.
        #
        # @option options [date] :date
        #   Selects the date for getting the statistical information. Format: YYYYMMDD
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-manager-stats
        def manager_stats(options = {})
          get '/manager/stats', options
        end

        # Get manager stats by hour
        # Returns Wazuh statistical information per hour. Each number in the averages field represents the average of alerts per hour.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-manager-stats-by-hour
        def manager_stats_by_hour
          get '/manager/stats/hourly'
        end

        # Get manager stats by weekly
        # Returns Wazuh statistical information per week. Each number in the hours field represents the average alerts per hour for that specific day.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-manager-stats-by-week
        def manager_stats_by_weekly
          get '/manager/stats/weekly'
        end

        # Get remoted stats
        # Returns a summary of the current remoted stats.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-remoted-stats
        def manager_remoted_stats
          get '/manager/stats/remoted'
        end
      end
    end
  end
end
