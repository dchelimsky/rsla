Spec::Matchers.define :be_a_new do |klass|
  match do |model|
    klass === model && model.new_record?
  end
end

