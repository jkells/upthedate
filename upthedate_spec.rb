require 'rubygems'
require 'spec'
require 'upthedate'

describe 'UpTheDate' do
  describe '13/May/1983' do
    it 'should parse as a valid DateTime object' do
      dt = 13/May/1983
      dt.strftime("%Y/%m/%d").should == '1983/05/13'
    end
  end

  describe '18/Mar/1984' do
    it 'should parse as a valid DateTime object' do
      dt = 18/Mar/1984
      dt.strftime("%Y/%m/%d").should == '1984/03/18'
    end
  end
end
