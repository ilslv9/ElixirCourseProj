defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "greets the world" do
    deck = Cards.create_deck
    {hand, rest_of_deck} = Cards.deal deck, 1  
    assert hand == ["Ace of Spades"]
  end
end
