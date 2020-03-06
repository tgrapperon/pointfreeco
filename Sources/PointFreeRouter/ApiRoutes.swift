import ApplicativeRouter
import Prelude
import Models

extension Route {
  public enum Api: Equatable {
    case episodes
    case episode(Episode)
  }
}

let apiRouter
  = apiRouters.reduce(.empty, <|>)

private let apiRouters: [Router<Route.Api>] = [
  .case(.episodes)
    <¢> "episodes" <% end,

  .case(Route.Api.episode)
    <¢> "episodes" %> pathParam(.episode) <% end
]
