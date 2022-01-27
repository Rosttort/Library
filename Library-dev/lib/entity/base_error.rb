# frozen_string_literal: true

module Lib
  module Entity
    class BaseError < StandardError
      STANDARD_MESSAGE = ''
      def initialize(message = STANDARD_MESSAGE)
        super(message)
      end
    end
  end
end
