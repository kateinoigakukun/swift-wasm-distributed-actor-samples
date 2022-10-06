import Distributed

distributed actor Worker {
  typealias ActorSystem = LocalTestingDistributedActorSystem

  distributed func hi() {
    print("hi \(self.description)!")
  }

  nonisolated var description: Swift.String {
    "Worker(\(id))"
  }
}

@main struct Main {
  static func main() async throws {
    let system = LocalTestingDistributedActorSystem()

    let actor = Worker(actorSystem: system)
    try await actor.hi()
  }
}
