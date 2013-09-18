require 'spec_helper'

describe "Insulter" do
  let (:insulter) { Insulter.new }

  describe ".insult_with" do
    CLASSIC_CHAIN = [
      [ "You're a",        "Your face is a" ],
      [ "You're an",       "Your face is an" ],
      [ "Your face is a",  "Your mum is a" ],
      [ "Your face is an", "Your mum is an" ],
      [ "Your mum is a",   "Your mum's face is a" ],
      [ "Your mum is an",  "Your mum's face is an" ],
    ]
    CLASSIC_CHAIN.each do | insult, response | 
      context "when insulted with \"#{insult} thing!\"" do
        subject { insulter.insult_with("#{insult} thing!") }
        it { should == "#{response} thing!" }
      end
    end

    END_OF_CHAIN = [
      "Your mum's face is a",
      "Your mum's face is an",
    ]
    END_OF_CHAIN.each do | insult | 
      context "when insulted with \"#{insult} thing!\"" do
        subject { insulter.insult_with("#{insult} thing!") }
        it { should == "That's what she said" }
      end
    end

    it "should be case-insensitive" do
      insulter.insult_with("yOuR Face IS A thing!").should == "Your mum is a thing!"
    end
    
    context "when the input doesn't lend itself to insults" do
      subject { insulter.insult_with("running")}
      it { should == "That's what she said" }
    end

    it "should handle an exclamation mark at the end of the input"
    it "should respond differently if there is no string after a 'You're a'"
    it "should treat 'ur' the same as 'you're' and your"
    it "should handle mum's the same as mum is"

    context "when passed empty input" do
      subject { insulter.insult_with("") }
      it { should == "Bring it on!" }
    end
    context "when passed blank input" do
      subject { insulter.insult_with("\t  ") }
      it { should == "Bring it on!" }
    end
    context "when passed nil input" do
      subject { insulter.insult_with nil }
      it { should == "Bring it on!" }
    end

    context "when passed a single word" do
      context "which is a noun" do
        subject { insulter.insult_with("thing") }
        it "should respond \"You're a <<noun>>\"" do
          subject.should == "You're a thing"
        end
      end 
    end

    context "when passed a phrase of several words" do
      context "which includes some nouns" do
        it "should insult using the last noun" do
          insulter.insult_with("I made an axe and hacked through the floor").should == "You're a floor"
        end
      end
    end
  end
end
