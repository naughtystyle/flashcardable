module Api
  module V1
    class CardsController < BaseController
      def index
        render json: serializer(deck.cards)
      end

      def show
        render json: serializer(card)
      end

      def create
        card = deck.cards.new(card_params)

        if card.save
          render json: serializer(card), status: :created
        else
          render json: errors(card), status: :unprocessable_entity
        end
      end

      def update
        if card.update(card_params)
          head :no_content
        else
          render json: errors(card), status: :unprocessable_entity
        end
      end

      def destroy
        card.destroy

        head :no_content
      end

      private

      def card
        deck.cards.find(params[:id])
      end

      def deck
        Deck.find(params[:deck_id])
      end

      def serializer(serializable)
        CardSerializer.new(serializable).serialized_json
      end

      def errors(card)
        {
          errors: {
            title: "UnprocessableEntity",
            detail: card.errors.full_messages.join(", ")
          }
        }
      end

      def card_params
        params.require(:card).permit(:title, :question, :answer)
      end
    end
  end
end
