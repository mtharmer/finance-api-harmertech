import EmailPassword from "supertokens-node/recipe/emailpassword";
import Session from "supertokens-node/recipe/session";
import type { TypeInput } from "supertokens-node/types";

export function getApiDomain() {
    const apiUrl = process.env.FINANCE_API_URL || '';
    return apiUrl;
}

export function getWebsiteDomain() {
    const websiteUrl = process.env.FINANCE_URL || '';
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
