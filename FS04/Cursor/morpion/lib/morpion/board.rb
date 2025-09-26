# frozen_string_literal: true

# Plateau 3x3, gère les coups et la détection de fin
class Board
  ROWS = %w[A B C].freeze
  COLS = %w[1 2 3].freeze

  attr_reader :cases, :moves_count

  def initialize
    # Hash des cases: { "A1" => BoardCase.new("A1"), ... }
    @cases = {}
    ROWS.product(COLS).each do |row, col|
      key = "#{row}#{col}"
      @cases[key] = BoardCase.new(key)
    end
    @moves_count = 0
  end

  # Joue un symbole ("X" ou "O") dans la case key
  # Renvoie true si réussi, false sinon
  def play_at(key, symbol)
    cell = @cases[key]
    return false unless cell && cell.empty?

    cell.value = symbol
    @moves_count += 1
    true
  end

  # Statut de la partie via le plateau
  # :x, :o, :draw, :ongoing
  def status
    winner_symbol = detect_winner_symbol
    return :x if winner_symbol == "X"
    return :o if winner_symbol == "O"
    return :draw if full?
    :ongoing
  end

  # Plateau plein ?
  def full?
    @moves_count >= 9
  end

  # Réinitialise le plateau
  def reset!
    @cases.each_value { |c| c.value = nil }
    @moves_count = 0
  end

  private

  # Détecte si X ou O aligne 3 cases
  def detect_winner_symbol
    lines = winning_lines
    ["X", "O"].each do |sym|
      return sym if lines.any? { |line| line.all? { |k| @cases[k].value == sym } }
    end
    nil
  end

  # Les 8 lignes gagnantes: 3 lignes, 3 colonnes, 2 diagonales
  def winning_lines
    rows = ROWS.map { |r| COLS.map { |c| "#{r}#{c}" } }
    cols = COLS.map { |c| ROWS.map { |r| "#{r}#{c}" } }
    diags = [["A1", "B2", "C3"], ["A3", "B2", "C1"]]
    rows + cols + diags
  end
end
