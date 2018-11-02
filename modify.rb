# コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
class BasePlayer
  HAND = ['グー', 'チョキ', 'パー']

  attr_accessor :hand

  def display_hand
    HAND[@hand]
  end
end

class Player < BasePlayer
  def select_hand
    display_message
    set_hand
  end

  private

  def set_hand
    data = gets.chop
    if valid?(data)
      @hand = data.to_i
    else
      puts "０から2を入力してください"
      set_hand
    end
  end

  def display_message
    puts "数字を入力してください。"
    puts "0: グー"
    puts "1: パー"
    puts "2: チョキ"
    puts "じゃんけん・・・"
  end

  def valid?(data)
    ['0', '1', '2'].include?(data)
  end
end

# グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
class Enemy < BasePlayer
  def select_hand
    @hand = rand(3)
  end
end

class Janken
  def initialize(player, enemy)
    @player = player
    @enemy = enemy
  end

  def pon
    select_hand
    display_hand
    execute_judge
  end

  private

  def select_hand
    @player.select_hand
    @enemy.select_hand
  end

  def judge
    (@enemy.hand - @player.hand + 3) % 3
  end

  def display_hand
    puts "あなたの手は#{@enemy.display_hand}, わたしの手は#{@player.display_hand}"
  end

  def execute_judge
    if draw?
      puts "あいこで..."
      pon
      return
    end

    puts result_message
  end

  def draw?
    judge == 0
  end

  def victory?
    judge == 1
  end

  def lose?
    judge == 2
  end

  def result_message
    victory? ? "あたなの勝ちです" : "あなたの負けです"
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new(player, enemy)
janken.pon
