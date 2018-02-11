require 'skeletron/null/entity_gateway/transactor'

module Skeletron
  module Null
    module EntityGateway
      class Transactor
        include Skeletron::EntityGateway::Transactor

        def transaction
          yield
        end
      end
    end
  end
end
