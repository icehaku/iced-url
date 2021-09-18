require "rails_helper"

RSpec.describe SlugsController, type: :controller do
  it { is_expected.to use_before_action :set_slug }

  describe "#index" do
    it "renders the index template" do
      get :new

      expect(response).to render_template(:new)
    end

    it "has a 200 status code" do
      get :new

      expect(response.status).to eq(200)
    end

    it "instantiate the slug model" do
      get :new

      expect(assigns(:slug)).to be_a Slug
    end
  end

  describe "#create" do
    let(:slug) { build(:slug) }

    it "create a new Slug" do
      expect { 
        get :create, params: { slug: slug.attributes }
      }.to change { Slug.count }
    end
  end

  describe "#stats" do
    let(:click) { create(:click) }

    it "instantiate the slug clicks" do
      get :stats, params: { short_url: click.slug.short_url }

      expect(assigns(:clicks).first).to be_a Click
    end
  end

  describe "#navigate" do
    let(:slug) { create(:slug) }

    subject { get :navigate, params: { short_url: slug.short_url } }

    it "create a new Slug" do     
      expect(subject).to redirect_to(slug.target_url)
    end

    it "create a new Click" do     
      expect { subject }.to change { Click.count }
    end    
  end
end
