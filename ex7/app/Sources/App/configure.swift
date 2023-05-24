import Vapor
import Fluent
import FluentSQLiteDriver
import Leaf

// configures your application
public func configure(_ app: Application) async throws {

    app.http.server.configuration.hostname = "0.0.0.0"
    app.http.server.configuration.port = 1323

    app.views.use(.leaf)
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.migrations.add(CreateProduct())

    // register routes
    try routes(app)
}
