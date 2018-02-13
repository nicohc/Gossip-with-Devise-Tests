class GossipsController < ApplicationController

    def new
      if user_signed_in?
          @gossip = Gossip.new
      else
          #Pour empëcher les petits malins de poster sans s'ëtre connecté !
          redirect_to root_url
          flash[:danger] = "Veuillez vous connecter pour créer un nouveau gossip."
      end
    end

    def create
      @gossip = Gossip.new(gossip_params)
      @gossip.user = current_user
      if @gossip.save
        redirect_to @gossip
      else
        render 'new'
      end
    end

    def show
      @gossip = Gossip.find(params[:id])
    end

    def edit
      @gossip = Gossip.find(params[:id])
      #Condition pour éviter l'édition de gossips dont on n'est pas le creator.
      if @gossip.user.id != current_user.id
        flash[:danger] = 'Accès refusé ! '
        redirect_to root_path
      end
    end

    def update
          @gossip = Gossip.find(params[:id])
          if @gossip.update(gossip_params)
            redirect_to @gossip
          else
            render 'edit'
          end
    end

    def destroy
      @gossip = Gossip.find(params[:id])
      #Condition pour éviter la suppression de gossips dont on n'est pas le creator.
      if @gossip.user.id != current_user.id
        flash[:danger] = 'Ca te dérange ? Y a un problème ? Accès refusé ! '
        redirect_to root_path
      else
        @gossip.destroy
        redirect_to root_path
      end
    end

    private
      def gossip_params
        params.permit(:content)
      end

end
