function loadEnv(keyname: string) {
    const envvar = process.env[keyname];

    if (!envvar) {
        throw new Error(`Environment variable ${keyname} is not set`);
    }

    return envvar;
}

export default {
    database: loadEnv("DB_URI")
}