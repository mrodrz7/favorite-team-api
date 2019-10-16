# frozen_string_literal: true

class TeamsController < ProtectedController
  before_action :set_team, only: %i[show update destroy]

  # GET /examples
  # GET /examples.json
  def index
    @teams = current_user.teams.all

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
    puts @team

    if @team.save
      render json: @team, status: :created
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    @team = current_user.teams.find(params[:id])
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = current_user.teams.find(params[:id])
    @team.destroy
  end

  private

  def set_team
    @team = current_user.teams.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:team_name, :sport, :trophies)
  end

  private :set_team, :team_params
end
