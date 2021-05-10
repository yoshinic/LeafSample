import Vapor

func routes(_ app: Application) throws {
    app.get { req -> EventLoopFuture<View> in
        return req.view.render("index", StringContext())
    }
}

struct StringContext: Encodable {
    let title: String = "Leaf Sample"
    let a: [String] = [1, 200, 3000, 400000].map { String.localizedStringWithFormat("%d", $0) }
}
