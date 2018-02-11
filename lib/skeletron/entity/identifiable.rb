module Skeletron
  module Entity
    module Identifiable
      def self.included(base)
        base.include(InstanceMethods)
      end

      module InstanceMethods
        attr_accessor :id

        def initialize(id = nil)
          @id = id
        end
      end
    end
  end
end
