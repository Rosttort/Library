# frozen_string_literal: true

module Lib
  module Modules
    module Errors
      class NegativeOrZeroError < Entity::BaseError
        STANDARD_MESSAGE = 'Integer was negative or zero'
      end
    end
  end
end
