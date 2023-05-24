import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("hello") { req -> EventLoopFuture<View> in
        return req.view.render("hello", ["name": "Leaf"])
    }

    let productController = ProductController()
    app.post("product", use: productController.create)
    app.get("product", use: productController.readAll)
    app.get("product", ":id", use: productController.read)
    app.post("product", ":id", use: productController.update)
    app.delete("product", ":id", use: productController.delete)
}
