require File.dirname(__FILE__) + '/../test'

describe "Array operation" do
  specify { double_it([1, 2, 3, 4]).should == [2, 4, 6, 8] }
  specify { double_it([]).should == [] }
  specify { sum([1, 2, 3, 4]).should == 10 }
  specify { sum([]).should == 0 }
  specify { above_10?([1, 2, 3, 4]).should be_false }
  specify { above_10?([1, 2, 11, 4]).should be_true }
  specify { above_10?([]).should be_false }
  specify { all_above_10?([12]).should be_true }
  specify { all_above_10?([11,12,10]).should be_false }
  specify { all_above_10?([]).should be_false }
end