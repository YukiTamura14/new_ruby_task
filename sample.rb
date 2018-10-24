# コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
class Player
  def hand
    gets
  end
end

# グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
class Enemy
  def hand
    rand(3)
  end
end

class Janken_start
  def janken_start
    rock_paper_scissors = ['[0]:グー,[1]:チョキ,[2]:パー','じゃんけん...']
    rock_paper_scissors.each do |janken|
      puts janken
    end
  end
end

class Janken
  def pon(janken_start, player_hand, enemy_hand)
    janken_start = Janken_start.new
    janken_start
    hand = ['グー','チョキ','パー']
    if player_hand == "0\n" || player_hand == "1\n" || player_hand == "2\n"
      judge =(enemy_hand - player_hand.to_i + 3) % 3
      p "あなたの手は#{hand[player_hand.to_i]}, わたしの手は#{hand[enemy_hand]}"
      if judge == 0
        p "あいこで..."
        player = Player.new
        enemy = Enemy.new
        janken = Janken.new
        janken_start = Janken_start.new
        janken.pon(janken_start.janken_start, player.hand, enemy.hand)
      elsif judge == 1
        p "あたなの勝ちです"
      else judge == 2
        p "あなたの負けです"
      end
    else
      p "０から2を入力してください"
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new
      janken_start = Janken_start.new
      janken.pon(janken_start.janken_start, player.hand, enemy.hand)
    end
  end
end

# class Playerの振る舞いを持ったインスタンスを生成する。こうすることで、playerと言う名前の変数にPlayerクラスに定義されているメソッドをplayerが使えるようになる。
# Playerはクラス、playerはローカル変数
player = Player.new
enemy = Enemy.new
janken = Janken.new
janken_start = Janken_start.new
# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(janken_start.janken_start, player.hand, enemy.hand)
