module SpaceRoutes
  def self.append_routes(router)
    router.resource :authenticated_session, only: %i[new create update destroy show]
    router.resources :invitations, only: %i[create destroy index] do
      router.resource :rsvp, only: %i[show update]
    end
    router.resources :rooms, only: %i[show edit update new create destroy] do
      Furniture.append_routes(router)
      router.resources :furnitures, only: %i[create edit update destroy]
    end

    router.resources :utilities

    router.resources :memberships, only: %I[index show destroy]
  end
end
