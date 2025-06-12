import express from "express";
import cors from "cors";
import supertokens from "supertokens-node";
import validateSession from "./middleware/validateSession";
import { middleware, errorHandler, SessionRequest } from "supertokens-node/framework/express";
import { getWebsiteDomain, SuperTokensConfig, connectDB } from "./config/app.config";
import debtRoutes from "./routes/debts.routes";
import logger from "./logger";

logger.info("initializing authentication...");
supertokens.init(SuperTokensConfig);
logger.info("authentication initialized")

const app = express();

// Connect to the mongo database
logger.info("connecting to database...");

(async () => {
    try {
        await connectDB();
        logger.info('connected to mongodb');
    } catch (err) {
        logger.error('failed to connect to mongodb', {error: err});
        process.exit(1);
    }
})();

app.use(express.json());

app.use(
    cors({
        origin: getWebsiteDomain(),
        allowedHeaders: ["content-type", ...supertokens.getAllCORSHeaders()],
        methods: ["GET", "PUT", "POST", "DELETE"],
        credentials: true,
    })
);

// This exposes all the APIs from SuperTokens to the client.
app.use(middleware());

app.get("/status", async (_req, res) => {
    logger.http('received GET /status');
    res.status(200).send("success");
});

// An example API that requires session verification
app.get("/sessioninfo", validateSession(), async (req: SessionRequest, res) => {
    logger.http('received GET /sessioninfo');
    const session = req.session;
    res.send({
        sessionHandle: session!.getHandle(),
        userId: session!.getUserId(),
        accessTokenPayload: session!.getAccessTokenPayload(),
    });
});

// Pull in routing files to serve
app.use('/debts', debtRoutes);

// In case of session related errors, this error handler
// returns 401 to the client.
app.use(errorHandler());

export default app;