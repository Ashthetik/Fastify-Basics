import fp from "fastify-plugin";
import { FastifyInstance } from "fastify";

const ProductsDAO = (db: any) => {
    const createProduct = async (cat: any, title: any, price: any) => {
        const { id } = await db.one(
            "INSERT INTO products (category, title, price) VALUES ($1, $2, $3) RETURNING id",
            [cat, title, price]
        );

        return { id, cat, title, price };
    }

    const getAllProducts = async () => {
        const products = db.any("SELECT * FROM products");

        return products;
    }

    const getProductsById = async (id: any) => {
        const product = db.one("SELECT * FROM products WHERE id = $1", [id]);

        return product;
    }

    const updateProduct = (id: any, category: any, title: any, price: any) => {
        db.one(
            'UPDATE products SET category = $1, title = $2, price = $3 WHERE id = $4 RETURNING id',
            [category, title, price, id]
        );

        return { id, category, title, price }
    }

    const deleteProduct = async (id: any) => {
        await db.query(
            'DELETE FROM products WHERE id = $1',
            [id]
        );
    }

    return { createProduct, getAllProducts, getProductsById, updateProduct, deleteProduct };
}

export default fp(function(
    fastify: FastifyInstance | any,
    opts: any,
    next
) {
    fastify.decorate("productDAO", ProductsDAO(fastify.db));
    next();
})