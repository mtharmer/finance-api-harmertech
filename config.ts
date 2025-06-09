import EmailPassword from "supertokens-node/recipe/emailpassword";
import Session from "supertokens-node/recipe/session";
import type { TypeInput } from "supertokens-node/types";
import mongoose from "mongoose";

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
        appName: "SuperTokens Demo App",
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
    try {
        await mongoose.connect(MONGODB_URI);
        console.log('Connected to MongoDB');
    } catch (error) {
        console.error('Error connecting to MongoDB:', error);
    }
};
