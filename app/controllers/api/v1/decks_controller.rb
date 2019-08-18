module Api
  module V1
    class DecksController < BaseController
      def index
        render json: serializer(decks)
      end

      def show
        render json: serializer(deck, is_collection: false)
      end

      private

      def deck
        Deck.find(params[:id])
      end

      def decks
        Deck.published
      end

      def serializer(serializable, **options)
        DeckSerializer.new(serializable, options).serialized_json
      end
    end
  end
end
