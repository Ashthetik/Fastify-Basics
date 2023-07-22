import fp from "fastify-plugin";
import { FastifyInstance } from "fastify";

export default fp(async function(
    fastify: FastifyInstance,
    opts: any
) {
    fastify.register(require("@fastify/swagger"), {
        routePrefix: "/docs",
        swagger: {
            info: {
                title: "Fastify API",
                description: "Building a blazing fast REST API with Node.js, MongoDB, Fastify and Swagger",
                version: "0.1.0"
            },
            host: "localhost:3000",
            schemes: ["http"],
            consumes: ["application/json"],
            produces: ["application/json"],
        },
        exposeRoute: true
    });
});