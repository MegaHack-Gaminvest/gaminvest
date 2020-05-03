defmodule GaminvestWeb.Router do
  use GaminvestWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_root_layout, {GaminvestWeb.LayoutView, "root.html"}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GaminvestWeb do
    pipe_through :browser

    live "/", HomeLive
    live "/challenges", ChallengeLive
    live "/modules", ModuleLive
    live "/savings", SavingsLive
    #live "/profile", ProfileLive
  end

  scope "/api", GaminvestWeb.API do
    pipe_through :api

    resources "/modules", ModuleController, except: [:new, :edit]
    resources "/humans", HumanController, except: [:new, :edit]
  end

  scope "/api", GaminvestWeb.API do
    pipe_through :api
    post "/lesson/{id}/completion", ModulePointsController, :completion
  end

  # Other scopes may use custom stacks.
  # scope "/api", GaminvestWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: GaminvestWeb.Telemetry
    end
  end
end
