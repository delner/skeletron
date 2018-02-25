module Skeletron
  module Entity
    module Equivalency
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def define_hash(*args)
          (@hash_attributes = args).tap { set_hash_methods! }
        end

        def define_equality(*args)
          (@equality_attributes = args).tap { set_equality_methods! }
        end

        def hash_attributes
          @hash_attributes ||= []
        end

        def equality_attributes
          @equality_attributes ||= []
        end

        private

        def set_hash_methods!
          generate_hash_methods.tap do |mod|
            const_set(:"#{name.split('::').last}HashMethods", mod)
            include(mod)
          end
        end

        def set_equality_methods!
          generate_equality_methods.tap do |mod|
            const_set(:"#{name.split('::').last}EqualityMethods", mod)
            include(mod)
          end
        end

        def generate_hash_methods
          hash_attributes = self.hash_attributes

          Module.new do
            class_eval <<-METHODS, __FILE__, __LINE__ + 1
              def hash
                #{hash_attributes}.collect do |attribute|
                  self.send(attribute)
                end.hash
              end
            METHODS
          end
        end

        def generate_equality_methods
          equality_attributes = self.equality_attributes

          Module.new do
            class_eval <<-METHODS, __FILE__, __LINE__ + 1
              def eql?(o)
                self == o
              end

              def ==(o)
                o.class == self.class && #{equality_attributes}.all? do |f|
                  self.send(f) == o.send(f)
                end
              end
            METHODS
          end
        end
      end
    end
  end
end
