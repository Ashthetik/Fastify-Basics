"use strict";

import path from "path";
import Autoload from "@fastify/autoload";
import { FastifyInstance } from "fastify";

export default async function (fastify: FastifyInstance, opts: any): Promise<void> {
    // Custom code here

    // Autoload routes and plugins
    fastify.register(Autoload, {
        dir: path.resolve(__dirname, "routes"),
        options: Object.assign({}, opts)``
    });

    fastify.register(Autoload, {
        dir: path.resolve(__dirname, "plugins"),
        options: Object.assign({}, opts)
    });
}