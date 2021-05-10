import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return req.view.render("index", SampleContext())
    }
}

struct SampleContext: Encodable {
    let title: String = "Leaf Sample"
    let a: [Int] = [1, 200, 3000, 400000]
}
