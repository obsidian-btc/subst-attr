require_relative 'bench_init'

module StrictWithSubstitute
  class SomeDependency
    module Substitute
      def self.build
        :some_substutute
      end
    end
  end

  class Example
    extend SubstAttr::Macro

    subst_attr :some_attr, SomeDependency
  end
end

context "The impersonated class has an inner 'Substitute' constant with a 'build' method" do
  test "Impersonated class provides specialized substitute" do
    example = StrictWithSubstitute::Example.new
    assert(example.some_attr == :some_substutute)
  end
end
