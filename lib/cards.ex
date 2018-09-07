defmodule Cards do


  @moduledoc """
    Some documentation
  """

  @doc """ 
    Create array of strings which represent a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamons"]

    for suit <- suits, value <- values do
          "#{value} of #{suit}"
    end
  end

  def shuffle deck do
    Enum.shuffle(deck)
  end

  def contains? deck, hand do
    Enum.member?(deck, hand)
  end

  @doc """
    `hand_size` - How many cards in the hand?

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal deck, 1
      iex> hand
      ["Ace of Spades"]
      
  """
  def deal deck, hand_size do
    Enum.split(deck, hand_size)
  end

  def save deck, filename do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load filename do
    case File.read filename do
      {:ok, body} -> :erlang.binary_to_term body
      {:error, _reason} -> "Ooops...("
    end
  end

  def create_hand hand_size do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal hand_size
  end
end
