import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.views.use(.leaf)
    app.leaf.tags[CommaTag.name] = CommaTag()
    
    // register routes
    try routes(app)
}

// 数字を、カンマ付き文字列に変換
struct CommaTag: LeafTag {
    static let name = "comma"
    
    func render(_ ctx: LeafContext) throws -> LeafData {
        guard
            ctx.parameters.count == 1,
            let i = ctx.parameters[0].int
            else { throw "引数には、一つの数字を指定して下さい。" }
        return .string(String.localizedStringWithFormat("%d", i))
    }
}
