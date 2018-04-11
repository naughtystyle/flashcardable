module Api
  module V1
    class DecksController < BaseController
      def index
        render json: serializer(decks)
      end

      def show
        render json: serializer(deck)
      end

      private

      def deck
        Deck.find(params[:id])
      end

      def decks
        Deck.published
      end

      def serializer(serializable)
        DeckSerializer.new(serializable).serialized_json
      end
    end
  end
end
