require 'spec_helper'

module Codebreaker
  describe Marker do

    describe "#exact_match_count" do

      context "no matches" do
        it "should return 0" do
          marker = Marker.new('1234', '5555')
          marker.exact_match_count.should == 0
        end
      end

      context "1 exact match" do
        it "should return 1" do
          marker = Marker.new('1234', '5535')
          marker.exact_match_count.should == 1
        end
      end

      context "2 exact matches" do
        it "should return 2" do
          marker = Marker.new('1234', '5235')
          marker.exact_match_count.should == 2
        end
      end

      context "3 exact matches" do
        it "should return 3" do
          marker = Marker.new('1234', '5234')
          marker.exact_match_count.should == 3
        end
      end

      context "4 exact matches" do
        it "should return 4" do
          marker = Marker.new('1234', '1234')
          marker.exact_match_count.should == 4
        end
      end

      context "4 number matches" do
        it "should return 0" do
          marker = Marker.new('1234', '4321')
          marker.exact_match_count.should == 0
        end
      end

    end
  end
end
