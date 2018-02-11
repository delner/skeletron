require 'skeletron/entity/identifiable'
require 'skeletron/entity/relatable'

module Skeletron
  module Entity
    def self.included(base)
      base.include(Identifiable)
      base.include(Relatable)
    end
  end
end
