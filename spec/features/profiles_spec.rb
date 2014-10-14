 require 'rails_helper'

 describe "Visiting profiles" do
 
  include Warden::Test::Helpers
  Warden.test_mode!
 
  describe "not signed in" do
    before do 
     @user = create(:user)
     @post = create(:post, user: @user)
     @comment = create(:comment, user: @user, post: @post)
    end

    it "shows profile" do
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      expect( page ).to have_content(@user.name)
      expect( page ).to have_content(@post.title)
      expect( page ).to have_content(@comment.body)      
    end
   end

    describe "signed in" do
      before do
        @user = create(:user)
        @post = create(:post, user: @user)
        @comment = create(:comment, user: @user, post: @post)
      end

      it "shows profile" do
        visit user_path(@user)
        expect(current_path).to eq(user_path(@user))

        expect( page ).to have_content(@user.name)
        expect( page ).to have_content(@post.title)
        expect( page ).to have_content(@comment.body)      
      end

    Warden.test_reset!
  end
 end