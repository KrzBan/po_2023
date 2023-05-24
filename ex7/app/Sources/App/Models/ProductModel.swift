import Vapor
import Fluent

final class Product: Model {
    
    struct Input: Content {
        let name: String
    }

    struct Output: Content {
        let id: String
        let name: String
    }

    static let schema = "products"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    init() { }

    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

struct CreateProduct: AsyncMigration {

    func prepare(on database: Database) async throws {
        try await database.schema("products")
            .id()
            .field("name", .string)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("products").delete()
    }
}