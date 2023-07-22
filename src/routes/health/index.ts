import { FastifyInstance } from "fastify";

export default async function(
    fastify: FastifyInstance,
    opts: any
): Promise<void> {
    fastify.get("/health", {
        schema: {
            description: "Health check endpoint",
            tags: ["health"],
            response: {
                200: {
                    description: "Successful response",
                    type: "object",
                    properties: {
                        status: { type: "string" },
                        msg: { type: "string" }
                    }
                }
            }
        }
    }, async function(request, reply) {
        reply.send({ status: "ok", msg: "Hello world!" });
    });
}