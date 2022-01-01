class V1::TodosController < ApplicationController
  def index
    todo = Todo.all
    render json: todo
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo
    else
      render json: todo.errors
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    if todo.destroy
      render json: todo
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :user_id)
  end
end

# TODOに関する処理を書いていくコントローラー
# vはバージョンを表す英単語、数字はバージョンを示す
  # 理由：バージョン分けをすることで、新機能として追加した際も影響が出ないようにするため
  # 古い形式でアクセスしてくるユーザーに対してはv1でAPIを渡す。新しいユーザーはバージョン2のAPIで渡す

# オブジェクトをjson形式で返す理由
  # JavaScriptで非同期通信を行なってSPAを作成する際に、フロントエンド側でjsonのデータを使用するため
  # 通常のRailsアプリケーションはHTMLをユーザーに返している