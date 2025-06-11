import EmailPassword from "supertokens-node/recipe/emailpassword";
import Session from "supertokens-node/recipe/session";
import type { TypeInput } from "supertokens-node/types";
import mongoose from "mongoose";
import dotenv from 'dotenv';
dotenv.configDotenv({path: `./.env.${process.env.NODE_ENV}`, override: true})

export function getApiDomain() {
    const apiUrl = process.env.VITE_FINANCE_API_URL || '';
    return apiUrl;
}

export function getWebsiteDomain() {
    const websiteUrl = process.env.VITE_FINANCE_URL || '';
    return websiteUrl;
}

export const SuperTokensConfig: TypeInput = {
    supertokens: {
        connectionURI: process.env.SUPERTOKENS_URI || "",
        apiKey: process.env.SUPERTOKENS_API_KEY || "",
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

const MONGODB_URI = process.env.MONGODB_URI || '';

export const connectDB = async () => {
    await mongoose.connect(MONGODB_URI);
};
