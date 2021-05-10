import Vapor

func routes(_ app: Application) throws {
    app.get { req -> EventLoopFuture<View> in
        return req.view.render("index", WebsitesContext())
    }
}

struct WebsitesContext: Encodable {
    let title: String = "Leaf Sample"
    let a: [String] = ["太郎", "花子"]
}
