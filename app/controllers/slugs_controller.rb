class SlugsController < ApplicationController
  before_action :set_slug, only: %i[ stats navigate ]

  def new
    @slug = Slug.new
  end

  def create
    @slug = Slug.new(slug_params)

    respond_to do |format|
      if @slug.save
        format.html { redirect_to slug_stats_url(@slug.short_url), notice: "Slug created!" }
        format.json { render :stats, status: :created, location: @slug }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @slug.errors, status: :unprocessable_entity }
      end
    end
  end

  def stats
    raise "stats"
  end

  def navigate
    raise "navigate"
  end

  private
    def set_slug
      @slug = Slug.find_by_short_url(params[:short_url])
    end

    def slug_params
      params.require(:slug).permit(:short_url, :target_url)
    end
end
