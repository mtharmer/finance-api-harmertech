import "reflect-metadata"
import EmailPassword from "supertokens-node/recipe/emailpassword";
import Session from "supertokens-node/recipe/session";
import type { TypeInput } from "supertokens-node/types";
import { DataSource } from "typeorm";
import { Debt } from "./entity/Debt";
import dotenv from 'dotenv';
dotenv.configDotenv({path: `./.env.${process.env.NODE_ENV}`, override: true})
import logger from "./logger";

logger.info('ENVIRONMENT VARIABLES');
logger.info('=========================================================');
logger.info(`NODE_ENV=${process.env.NODE_ENV}`);
logger.info(`PG_DB_URL=${process.env.PG_DB_URL}`);
logger.info(`API_PORT=${process.env.API_PORT}`);
logger.info(`VITE_FINANCE_API_URL=${process.env.VITE_FINANCE_API_URL}`);
logger.info(`SUPERTOKENS_URI=${process.env.SUPERTOKENS_URI}`);
logger.info(`SUPERTOKENS_API_KEY=${process.env.SUPERTOKENS_API_KEY}`);
logger.info('=========================================================');

export function getApiDomain() {
    const apiUrl = process.env.VITE_FINANCE_API_URL || 'http://localhost:3001';
    return apiUrl;
}

export function getWebsiteDomain() {
    const websiteUrl = process.env.VITE_FINANCE_URL || 'http://localhost:5173';
    return websiteUrl;
}

export const SuperTokensConfig: TypeInput = {
    supertokens: {
        connectionURI: process.env.SUPERTOKENS_URI || "http://localhost:8000",
        apiKey: process.env.SUPERTOKENS_API_KEY || "somekey",
    },
    appInfo: {
        appName: "Finance API Harmertech",
        apiDomain: getApiDomain(),
        websiteDomain: getWebsiteDomain(),
        apiBasePath: "/auth", 
        websiteBasePath: "/auth", 
    },
    recipeList: [
        EmailPassword.init(),
        Session.init()
    ],
};

export const db = new DataSource({
    type: 'postgres',
    url: process.env.PG_DB_URL,
    synchronize: true,
    logging: true,
    entities: [Debt],
    subscribers: [],
    migrations: ["migration/*.ts"],
});
