 require 'rails_helper'
 
 describe User do
 
   include TestFactories

   before do
    @user = authenticated_user
    @post = associated_post
    @not_favorited = @user.favorited(@post)
    @favorited = @user.favorites.create(post: @post)
   end
 
   describe "#favorited(post)" do
    it "returns `nil` if the user has not favorited the post" do
      expect(@not_favorited)
      .to eq(nil)
    end
 
    it "returns the appropriate favorite if it exists" do
      expect(@favorited)
      .to eq(@user.favorites.where(post_id: @post.id).first)
   end
 end
end
