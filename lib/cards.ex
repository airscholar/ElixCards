defmodule Cards do
  @moduledoc """
    Provides method for creating and dealing with cards.
  """

  @doc """
    Create a new list of stringgs representing the cards.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffle the cards in the deck.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Check if the card is in the deck.

    ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Two of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides the deck into two parts. The first is the cards dealt and the other is the remainder of the deck.
    `hand_size` is the second parameter which takes a number supplied by the user. This represents the number of cards to deal.

  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand, _deck_data} = Cards.deal(deck, 2)
      iex> hand
      ["Ace of Spades", "Two of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def load(file_name) do
    case File.read(file_name) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exists"
    end
  end

  def create_and_deal(hand_size) do
    create_deck() |> shuffle() |> deal(hand_size)
  end

  def hello() do
    :world
  end
end
