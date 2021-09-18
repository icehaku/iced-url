class SlugsController < ApplicationController
  before_action :set_slug, only: %i[ stats navigate ]

  def new
    @slug = Slug.new
  end

  # I could use a flash/notice to have a better feedback here,
  # but I'll just keep it super simple
  def create
    @slug = Slug.new(slug_params)

    if @slug.save
      redirect_to slug_stats_url(@slug.short_url)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def stats;end

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
