module Skeletron
  module Entity
    module Relatable
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def define_associates(*args)
          (@associates = args).tap { set_association_methods! }
        end

        def associates
          @associates ||= []
        end

        private

        def set_association_methods!
          generate_association_methods.tap do |mod|
            const_set(:AssociationMethods, mod)
            include(mod)
          end
        end

        def generate_association_methods
          associates = self.associates

          Module.new do
            class_eval <<-METHODS, __FILE__, __LINE__ + 1
              #{associates.collect { |k| "attr_accessor :#{k}" }.join("\n")}
            METHODS
          end
        end
      end
    end
  end
end
