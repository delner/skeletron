require 'skeletron/entity/attributes'
require 'skeletron/entity/equivalency'
require 'skeletron/entity/identifiable'
require 'skeletron/entity/nullable'
require 'skeletron/entity/relatable'

module Skeletron
  module Entity
    def self.included(base)
      base.include(Identifiable)
      base.include(Attributes)
      base.include(Equivalency)
      base.include(Nullable)
      base.include(Relatable)
    end
  end
end
