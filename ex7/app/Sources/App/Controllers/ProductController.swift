import Fluent
import Vapor

struct ProductController {

    func create(req: Request) throws -> EventLoopFuture<Product.Output> {
        let input = try req.content.decode(Product.Input.self)
        let product = Product(name: input.name)
        return product.save(on: req.db)
             .map { Product.Output(id: product.id!.uuidString, name: product.name) }
    }

    func readAll(req: Request) throws -> EventLoopFuture<Page<Product.Output>> {
        return Product.query(on: req.db).paginate(for: req).map { page in
            page.map { Product.Output(id: $0.id!.uuidString, name: $0.name) }
        }
    }

    func read(req: Request) throws -> EventLoopFuture<Product.Output> {
        guard let id = req.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        return Product.find(id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .map { Product.Output(id: $0.id!.uuidString, name: $0.name) }
    }

    func update(req: Request) throws -> EventLoopFuture<Product.Output> {
        guard let id = req.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        let input = try req.content.decode(Product.Input.self)
        return Product.find(id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { product in
                product.name = input.name
                return product.save(on: req.db)
                    .map { Product.Output(id: product.id!.uuidString, name: product.name) }
            }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        guard let id = req.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        return Product.find(id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .map { .ok }
    }
}