# frozen_string_literal: true

module Lib
  module Modules
    module Errors
      class UnexpectedClassError < Entity::BaseError
        STANDARD_MESSAGE = 'Not expected class'
      end
    end
  end
end
