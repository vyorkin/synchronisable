module Synchronisable
  module Helper
    # Logging helper methods
    #
    # @api private
    module Logging
      protected

      %i(verbose colorize).each do |name|
        define_method("#{name}_logging?".to_sym) do
          Synchronisable.logging[name]
        end
      end

      def log_info(msg, color = :white, force = true)
        text = msg.colorize(color) if colorize_logging?
        logger.info(text) if force || verbose_logging?
      end
    end
  end
end
