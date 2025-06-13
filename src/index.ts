import "reflect-metadata";
import app from './app';
import logger from './logger';
import { db } from './app.config';

const port = Number(process.env.API_PORT) || 3001

logger.info("connecting to database...");
try {
  if (!db.isInitialized) await db.initialize();
  logger.info('initialized database');
  app.listen(port, '127.0.0.1', 1, () => logger.info(`API Server listening on port ${port}`));
} catch (err) {
  logger.error("failed to initialize database", err);
}
