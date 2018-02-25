module Skeletron
  module Entity
    module Attributes
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def define_attributes(*args)
          (@attributes = args).tap { set_attribute_methods! }
        end

        def attributes
          @attributes ||= []
        end

        private

        def set_attribute_methods!
          generate_attribute_methods.tap do |mod|
            const_set(:"#{name.split('::').last}AttributeMethods", mod)
            include(mod)
          end
        end

        def generate_attribute_methods
          attributes = self.attributes

          Module.new do
            class_eval <<-METHODS, __FILE__, __LINE__ + 1
              #{attributes.collect { |k| "attr_accessor :#{k}" }.join("\n")}

              def initialize(attributes = {})
                attributes.each do |key, value|
                  self.send("\#{key}=", value)
                end
              end
            METHODS
          end
        end
      end
    end
  end
end
