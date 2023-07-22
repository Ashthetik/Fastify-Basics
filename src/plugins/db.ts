import fp from "fastify-plugin";
import { FastifyInstance } from "fastify";
import Postgres from "pg-promise";

const pgp = Postgres();

const configuration = require("../config/config");

export default fp(function(
    fastify: FastifyInstance,
    opts: any,
    done
) {
    const db = pgp(configuration.database as string);
    fastify.decorate("db", db);
    done();
});