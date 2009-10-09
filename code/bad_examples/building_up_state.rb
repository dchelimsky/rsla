class Follower
end

class Article
end

class Author
  def popular?
    followers.length >= 37
  end
  
  def followers
    @followers ||= []
  end
  
  def articles
    @articles ||= []
  end
end

describe Author do
  before(:each) do
    @author = Author.new
  end
  context "with one article" do
    before(:each) do
      @author.articles << Article.new
    end
    context "and 37 followers" do
      before(:each) do
        37.times { @author.followers << Follower.new }
      end
      
      it "is popular" do
        @author.should be_popular
      end
    end
    context "and 36 followers" do
      before(:each) do
        36.times { @author.followers << Follower.new }
      end
      
      it "is not popular" do
        @author.should_not be_popular
      end
    end
  end
end

describe Author do
  context "with one article" do
    context "and 37 followers" do
      it "is popular" do
        author = Author.new
        author.articles << Article.new
        37.times { author.followers << Follower.new }
        author.should be_popular
      end
    end

    context "and 36 followers" do
      it "is not popular" do
        author = Author.new
        author.articles << Article.new
        36.times { author.followers << Follower.new }
        author.should_not be_popular
      end
    end
  end
end

describe Author do
  context "with one article" do
    before(:each) do
      @author = Author.new
      @author.articles << Article.new
    end
    context "and 37 followers" do
      it "is popular" do
        37.times { @author.followers << Follower.new }
        @author.should be_popular
      end
    end

    context "and 36 followers" do
      it "is not popular" do
        36.times { @author.followers << Follower.new }
        @author.should_not be_popular
      end
    end
  end
end
