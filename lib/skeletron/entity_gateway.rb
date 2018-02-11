require 'skeletron/entity_gateway/errors'
require 'skeletron/entity_gateway/creatable'
require 'skeletron/entity_gateway/deletable'
require 'skeletron/entity_gateway/readable'
require 'skeletron/entity_gateway/updatable'

module Skeletron
  module EntityGateway
    def self.included(base)
      base.include(Creatable)
      base.include(Readable)
      base.include(Updatable)
      base.include(Deletable)
    end
  end
end
