class ArtworksController < ApplicationController

    def index
        @artworks = Artwork.all
        render json: @artworks
        # render plain: "I'm in the index action"
    end


    def create
        # user = User.new(params.require(:user).permit(:name, :email))
        # user.save!
        # render json: user

        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end


    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        redirect_to artworks_url
    end


    def update
        @artwork = Artwork.find(params[:id])


        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end


    private

    def artwork_params
        params.require(:artwork).permit(:title, :img_url)
    end

end