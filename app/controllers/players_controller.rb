class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]

  def score_board
    players_ids = Player.joins(:scores).group('players.id').having("count(scores.id)>=10")
    @players = Player.where(id: players_ids).includes(:scores).order("scores.points desc").limit(10)
  end

  # GET /players or /players.json
  def index
    @players = Player.all
  end

  # GET /players/1 or /players/1.json
  def show
    scores = @player.scores.order(points: :desc)
    high_score = scores.first
    @member_profile = {
                        full_name: @player.full_name.capitalize,
                        contact: @player.contact,
                        no_of_wins: scores&.win&.count || 'NA',
                        no_of_loss: scores&.loss&.count || 'NA',
                        avg_score: scores.average(:points).to_f.round(2) || 0,
                        high_score: high_score&.points || 0,
                        when: high_score&.created_at&.strftime("%Y-%m-%d")|| 'NA',
                        game: high_score&.title&.capitalize|| 'NA',
                        whom: Score.where.not(player_id: @player.id).where(game_id: high_score&.game_id).first&.f_name&.capitalize || 'NA'  
                      }
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to player_url(@player), notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to player_url(@player), notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:f_name, :l_name, :join_date, :contact)
    end
end
