defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 20 cards" do
    deck_size = length(Cards.create_deck())
    assert deck_size == 20
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck()
    shuffled_deck = Cards.shuffle(deck)
    refute deck == shuffled_deck
  end
end
