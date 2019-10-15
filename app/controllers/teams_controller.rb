# frozen_string_literal: true

class TeamsController < OpenReadController
  before_action :set_example, only: %i[update destroy]

  # GET /examples
  # GET /examples.json
  def index
    @teams = Team.all

    render json: @teams
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    render json: Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = current_user.teams.build(team_params)

    if @team.save
      render json: @team, status: :created
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy

    head :no_content
  end

  def set_team
    @team = current_user.teams.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:team_name, :sport, :trophies)
  end

  private :set_team, :team_params
end
